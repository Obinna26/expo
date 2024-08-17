// Copyright 2024-present 650 Industries. All rights reserved.

//@_implementationOnly import ExpoModulesCoreCxx

public enum TypedArrayKind: Int32 {
  case Int8Array = 1
  case Int16Array = 2
  case Int32Array = 3
  case Uint8Array = 4
  case Uint8ClampedArray = 5
  case Uint16Array = 6
  case Uint32Array = 7
  case Float32Array = 8
  case Float64Array = 9
  case BigInt64Array = 10
  case BigUint64Array = 11
}

public class JavaScriptTypedArray: JavaScriptObject {
  let typedArray: expo.TypedArray
  public let kind: TypedArrayKind

  override init(runtime: JavaScriptRuntime, ptr: expo.ObjectSharedPtr) {
    let typedArray = expo.TypedArray(&runtime.pointee, ptr.pointee)
    var pointee = typedArray.toObject(&runtime.pointee)

    self.kind = TypedArrayKind(rawValue: typedArray.getKind(&runtime.pointee).rawValue)!
    self.typedArray = typedArray

    super.init(runtime: runtime, pointee: &pointee)
  }

  public func getUnsafeMutableRawPointer() -> UnsafeMutableRawPointer {
//    var rt = runtime!.get()
//    return typedArray.getRawPointer(&rt)
    fatalError()
  }
}
