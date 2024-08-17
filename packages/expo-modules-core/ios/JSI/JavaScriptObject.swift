// Copyright 2024-present 650 Industries. All rights reserved.

//@_implementationOnly import ExpoModulesCoreCxx

public class JavaScriptObject {
  internal weak var _runtime: JavaScriptRuntime?
  internal var ptr: expo.ObjectSharedPtr

  internal var runtime: JavaScriptRuntime {
    return _runtime!
  }

  init(runtime: JavaScriptRuntime, ptr: expo.ObjectSharedPtr) {
    self._runtime = runtime
    self.ptr = ptr
  }

  convenience init(runtime: JavaScriptRuntime, pointee: inout facebook.jsi.Object) {
    self.init(runtime: runtime, ptr: expo.makeShared(&runtime.pointee, &pointee))
  }

  convenience init(runtime: JavaScriptRuntime, pointee: consuming facebook.jsi.Object) {
    var pointee = pointee
    self.init(runtime: runtime, ptr: expo.makeShared(&runtime.pointee, &pointee))
  }

  func get() -> facebook.jsi.Object {
    return facebook.jsi.Value(&runtime.pointee, ptr.pointee).getObject(&runtime.pointee)
  }

  func getShared() -> Any {
    fatalError()
  }

  public func hasProperty(_ name: String) -> Bool {
    return ptr.pointee.hasProperty(&runtime.pointee, name)
  }

  public func getProperty(_ name: String) -> JavaScriptValue {
    let value = ptr.pointee.getProperty(&runtime.pointee, name)
    return JavaScriptValue(runtime: runtime, value: consume value)
  }

  public func getPropertyNames() -> [String] {
    let names: facebook.jsi.Array = ptr.pointee.getPropertyNames(&runtime.pointee)
    let count = names.size(&runtime.pointee)

    return (0..<count).map { i in
      return String(names.getValueAtIndex(&runtime.pointee, i).getString(&runtime.pointee).utf8(&runtime.pointee))
    }
  }

  public func setProperty(_ name: String, value: JavaScriptValue) {
    expo.setProperty(&runtime.pointee, ptr.pointee, name, value.value)
  }

  public func setProperty(_ name: String, object: JavaScriptObject) {
    expo.setProperty(&runtime.pointee, ptr.pointee, name, object.ptr.pointee)
  }

  public func setProperty(_ name: String, value: Any) {
    let value = JSIUtils.convertToJSIValue(runtime: &runtime.pointee, value: value)
    expo.setProperty(&runtime.pointee, ptr.pointee, name, value)
  }

  public func defineProperty(_ name: String, value: Any, options: [PropertyDescriptorOption]) {
    // TODO: options
    let descriptor = facebook.jsi.Object(&runtime.pointee)

    if options.contains(.configurable) {
      expo.setProperty(&runtime.pointee, descriptor, "configurable", facebook.jsi.Value(true))
    }
    if options.contains(.enumerable) {
      expo.setProperty(&runtime.pointee, descriptor, "enumerable", facebook.jsi.Value(true))
    }
    if options.contains(.writable) {
      expo.setProperty(&runtime.pointee, descriptor, "writable", facebook.jsi.Value(true))
    }

    let jsiValue = JSIUtils.convertToJSIValue(runtime: &runtime.pointee, value: value)
    expo.setProperty(&runtime.pointee, descriptor, "value", jsiValue)

    expo.common.defineProperty(&runtime.pointee, &ptr.pointee, name, descriptor)
  }

  public func defineProperty(_ name: String, descriptor: JavaScriptObject) {
    expo.common.defineProperty(&runtime.pointee, &ptr.pointee, name, descriptor.get())
  }

  // MARK: - WeakObject

  public func createWeak() -> JavaScriptWeakObject {
    return JavaScriptWeakObject(runtime: runtime, ptr: ptr)
  }
}
