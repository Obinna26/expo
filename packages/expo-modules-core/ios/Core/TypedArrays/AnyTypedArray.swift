// Copyright 2022-present 650 Industries. All rights reserved.

import ExpoModulesCoreJSI

/**
 A protocol for all typed arrays.
 */
internal protocol AnyTypedArray: AnyArgument {
  associatedtype ContentType: Numeric

  /**
   Initializes a typed array from the given JavaScript representation.
   */
  init(_ jsTypedArray: JavaScriptTypedArray)
}

// Extend the protocol to provide custom dynamic type
extension AnyTypedArray {
  public static func getDynamicType() -> AnyDynamicType {
    return DynamicTypedArrayType(innerType: Self.self)
  }
}
