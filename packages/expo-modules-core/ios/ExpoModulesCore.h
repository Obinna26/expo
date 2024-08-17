// Copyright 2015-present 650 Industries. All rights reserved.

// Uncomment this to temporarily disable Fabric.
// Also make sure to change `RCT_NEW_ARCH_ENABLED` C++ flag in Pods project's build settings.
//#undef RN_FABRIC_ENABLED

// Some headers needs to be imported from Objective-C code too.
// Otherwise they won't be visible in `ExpoModulesCore-Swift.h`.
#import <React/RCTView.h>

//#ifdef __cplusplus
//#import <jsi/jsi.h>
//#import <ReactCommon/RuntimeExecutor.h>
//#import <ReactCommon/CallInvoker.h>
//#endif

#if __has_include(<ExpoModulesCore/ExpoModulesCore-umbrella.h>)
#import <ExpoModulesCore/ExpoModulesCore-umbrella.h>
#endif
