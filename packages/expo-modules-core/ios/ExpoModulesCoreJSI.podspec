require 'json'

package = JSON.parse(File.read(File.join(__dir__, '..', 'package.json')))

reactNativeVersion = '0.0.0'
begin
  reactNativeVersion = `node --print "require('react-native/package.json').version"`
rescue
  reactNativeVersion = '0.0.0'
end

reactNativeTargetVersion = reactNativeVersion.split('.')[1].to_i

fabric_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'
fabric_compiler_flags = '-DRN_FABRIC_ENABLED -DRCT_NEW_ARCH_ENABLED'
folly_version = '2022.05.16.00'
folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -DFOLLY_CFG_NO_COROUTINES=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name           = 'ExpoModulesCoreJSI'
  s.version        = package['version']
  s.summary        = package['description']
  s.description    = package['description']
  s.license        = package['license']
  s.author         = package['author']
  s.homepage       = package['homepage']
  s.platforms       = {
    :ios => '15.1',
    :osx => '10.15',
    :tvos => '15.1'
  }
  s.swift_version  = '5.4'
  s.source         = { git: 'https://github.com/expo/expo.git' }
  s.static_framework = true

  header_search_paths = [
    '$(inherited)'
  ]

  pod_target_xcconfig = {
    'USE_HEADERMAP' => 'YES',
    'DEFINES_MODULE' => 'YES',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++20',
    'HEADER_SEARCH_PATHS' => header_search_paths.join(' '),
    'OTHER_SWIFT_FLAGS' => "$(inherited) #{fabric_enabled ? fabric_compiler_flags : ''} -Xcc -D -Xcc FOLLY_NO_CONFIG -Xcc -D -Xcc FOLLY_MOBILE=1 -Xcc -D -Xcc FOLLY_USE_LIBCPP=1 -Xcc -D -Xcc FOLLY_CFG_NO_COROUTINES=1"
  }
  user_header_search_paths = [
    # '"${PODS_CONFIGURATION_BUILD_DIR}/ExpoModulesCore/Swift Compatibility Header"',
    # '"$(PODS_ROOT)/Headers/Private/Yoga"', # Expo.h -> ExpoModulesCore-umbrella.h -> Fabric ViewProps.h -> Private Yoga headers
  ]
  s.user_target_xcconfig = {
    "HEADER_SEARCH_PATHS" => user_header_search_paths,
  }

  unless defined?(install_modules_dependencies)
    # `install_modules_dependencies` is defined from react_native_pods.rb.
    # when running with `pod ipc spec`, this method is not defined and we have to require manually.
    require File.join(File.dirname(`node --print "require.resolve('react-native/package.json')"`), "scripts/react_native_pods")
  end

  compiler_flags = folly_compiler_flags + ' ' + "-DREACT_NATIVE_TARGET_VERSION=#{reactNativeTargetVersion}"
  if ENV['USE_HERMES'] == nil || ENV['USE_HERMES'] == '1'
    compiler_flags += ' -DUSE_HERMES'
    s.dependency 'hermes-engine'
    s.pod_target_xcconfig = pod_target_xcconfig # meh
    add_dependency(s, "React-jsinspector", :framework_name => 'jsinspector_modern')
  else
    s.dependency 'React-jsc'
  end

  s.dependency 'React-Core'
  s.dependency 'ReactCommon/turbomodule/core'
  # s.dependency 'React-RCTAppDelegate'
  # s.dependency 'React-NativeModulesApple'

  if fabric_enabled
    compiler_flags << ' ' << fabric_compiler_flags

    s.dependency 'React-RCTFabric'
    s.dependency 'RCT-Folly', folly_version
  end

  install_modules_dependencies(s)

  if !$ExpoUseSources&.include?(package['name']) && ENV['EXPO_USE_SOURCE'].to_i == 0 && File.exist?("#{s.name}.xcframework")
    # s.source_files = ['JSI/**/*.{h,hpp}']
    s.vendored_frameworks = "#{s.name}.xcframework"
  else
    pod_target_xcconfig['SWIFT_OBJC_INTEROP_MODE'] = 'objcxx'
    s.source_files = ['JSI/**/*.{h,hpp,cpp,m,mm,swift}']
  end

  s.pod_target_xcconfig = pod_target_xcconfig
  s.compiler_flags = compiler_flags
end
