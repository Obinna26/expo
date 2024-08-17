// Copyright 2024-present 650 Industries. All rights reserved.

//@_implementationOnly import ExpoModulesCoreCxx

public class JavaScriptWeakObject {
  internal weak var _runtime: JavaScriptRuntime?

  internal var runtime: JavaScriptRuntime {
    return _runtime!
  }

  #if canImport(reacthermes)
  let ptr: facebook.jsi.WeakObject
  #else
  var ptr: expo.ObjectSharedPtr
  #endif

  init(runtime: JavaScriptRuntime, ptr: expo.ObjectSharedPtr) {
    self._runtime = runtime

    #if canImport(reacthermes)
    self.ptr = facebook.jsi.WeakObject(&runtime.pointee, ptr.pointee)
    #else
    if expo.common.isWeakRefSupported(&runtime.pointee) {
      self.ptr = expo.common.createWeakRef(&runtime.pointee, ptr)
    } else {
      self.ptr = ptr
    }
    #endif
  }

  public func lock() -> JavaScriptObject? {
    #if canImport(reacthermes)
    let value = ptr.lock(&runtime.pointee)
    #else
    let value = expo.common.derefWeakRef(&runtime.pointee, ptr)
    #endif

    if Bool(fromCxx: value) {
      return nil
    }
    return JavaScriptObject(runtime: runtime, pointee: &value.pointee)
  }
}
