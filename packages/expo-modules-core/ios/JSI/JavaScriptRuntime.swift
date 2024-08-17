// Copyright 2022-present 650 Industries. All rights reserved.

//import React
//@_implementationOnly import ExpoModulesCoreCxx

public typealias RCTPromiseResolveBlock = (_ result: Any) -> Void
public typealias RCTPromiseRejectBlock = (_ code: String?, _ message: String?, _ error: NSError?) -> Void

open class JavaScriptRuntime: NSObject {
  /**

   */
  public typealias ClassConstructor = (_ thisObject: JavaScriptObject, _ arguments: [JavaScriptValue]) -> Void

  /**
   A type of the closure that you pass to the `createSyncFunction` function.
   */
  public typealias SyncFunctionClosure = (_ this: JavaScriptValue, _ arguments: [JavaScriptValue]) throws -> Any

  /**

   */
  public typealias AsyncFunctionClosure = (_ thisValue: JavaScriptValue, _ arguments: [JavaScriptValue], _ resolve: RCTPromiseResolveBlock, _ reject: RCTPromiseRejectBlock) -> Void

  internal var runtime: expo.RuntimeSharedPtr
  internal let jsCallInvoker: expo.CallInvokerSharedPtr

  internal var pointee: facebook.jsi.Runtime {
    get {
      return runtime.pointee
    }
    set {
      runtime.pointee = newValue
    }
  }

  internal init(runtime: expo.RuntimeSharedPtr, callInvoker: expo.CallInvokerSharedPtr) {
    self.runtime = runtime
    self.jsCallInvoker = callInvoker
  }

  override public init() {
    let runtime = expo.makeRuntime()
    self.runtime = runtime
    self.jsCallInvoker = expo.makeSharedTestingSyncJSCallInvoker(runtime)
  }

  func get() -> facebook.jsi.Runtime {
    return runtime.pointee
  }

  func callInvoker() -> facebook.react.CallInvoker {
    return jsCallInvoker.pointee
  }

  public func createObject() -> JavaScriptObject {
    return JavaScriptObject(runtime: self, pointee: facebook.jsi.Object(&runtime.pointee))
  }

  public func createHostObject() -> JavaScriptObject {
    fatalError()
  }

  public func global() -> JavaScriptObject {
    fatalError()
  }

  public func createSyncFunction(_ name: String, argsCount: Int, _ closure: @escaping SyncFunctionClosure) -> JavaScriptObject {
    fatalError()
  }

  public func createAsyncFunction(_ name: String, argsCount: Int, _ closure: @escaping AsyncFunctionClosure) -> JavaScriptObject {
    fatalError()
  }

  public func createClass() -> JavaScriptObject {
    fatalError()
  }

  public func createObject(withPrototype prototype: JavaScriptObject) -> JavaScriptObject {
    let object = expo.common.createObjectWithPrototype(&runtime.pointee, &prototype.ptr.pointee)
    return JavaScriptObject(runtime: self, pointee: consume object)
  }

  public func createSharedObjectClass(_ name: String, constructor: ClassConstructor) -> JavaScriptObject {
//    expo.SharedObject.createClass(&runtime.pointee, name) { (runtime, thisValue, args, count) -> facebook.jsi.Value
//
//    }
    fatalError()
  }

  public func evaluateScript(_ script: String) -> JavaScriptValue {
//    let scriptBuffer = facebook.jsi.StringBuffer(std.string(script))
//    let result = runtime.evaluateJavaScript(scriptBuffer, "<<evaluated>>")
    fatalError()
  }

  public func schedule(_ callback: @escaping () -> Void) {
    fatalError()
  }

  public func createHostFunction() -> JavaScriptObject {
    fatalError()
  }

  /**
   Evaluates JavaScript code represented as a string.

   - Parameter source: A string representing a JavaScript expression, statement, or sequence of statements.
                       The expression can include variables and properties of existing objects.
   - Returns: The completion value of evaluating the given code represented as `JavaScriptValue`.
              If the completion value is empty, `undefined` is returned.
   - Throws: `JavaScriptEvalException` when evaluated code has invalid syntax or throws an error.
   - Note: It wraps the original `evaluateScript` to better handle and rethrow exceptions.
   */
  @discardableResult
  public func eval(_ source: String) throws -> JavaScriptValue {
//    do {
//      var result: JavaScriptValue?
//      try EXUtilities.catchException {
//        result = self.__evaluateScript(source)
//      }
//      // There is no risk to force unwrapping as long as the `evaluateScript` returns nonnull value.
//      return result!
//    } catch {
//      throw JavaScriptEvalException(error as NSError)
//    }
    fatalError()
  }

  /**
   Evaluates the JavaScript code made by joining an array of strings with a newline separator.
   See the other ``eval(_:)`` for more details.
   */
  @discardableResult
  func eval(_ source: [String]) throws -> JavaScriptValue {
    try eval(source.joined(separator: "\n"))
  }

  /**
   Creates a synchronous host function that runs the given closure when it's called.
   The value returned by the closure is synchronously returned to JS.
   - Returns: A JavaScript function represented as a `JavaScriptObject`.
   - Note: It refines the ObjC implementation from `EXJavaScriptRuntime` to properly catch Swift errors and rethrow them as ObjC `NSError`.
   */
  func createSyncFunction(_ name: String, argsCount: Int = 0, closure: @escaping SyncFunctionClosure) -> JavaScriptObject {
//    return __createSyncFunction(name, argsCount: argsCount) { this, args, errorPointer in
//      do {
//        return try runWithErrorPointer(errorPointer) {
//          return try closure(this, args)
//        }
//      } catch {
//        // Nicely log all errors to the console.
//        log.error(error)
//
//        // Can return anything as the error will be caught through the error pointer already.
//        return nil
//      }
//    }
    fatalError()
  }

  /**
   Schedules a block to be executed with granted synchronized access to the JS runtime.
   */
  func schedule(priority: SchedulerPriority = .normal, _ closure: @escaping () -> Void) {
//    __schedule(closure, priority: priority.rawValue)
  }
}

// Keep it in sync with the equivalent C++ enum from React Native (see SchedulerPriority.h from React-callinvoker).
public enum SchedulerPriority: Int32 {
  case immediate = 1
  case userBlocking = 2
  case normal = 3
  case low = 4
  case idle = 5
}

//internal final class JavaScriptEvalException: GenericException<NSError> {
//  override var reason: String {
//    return param.userInfo["message"] as? String ?? "unknown reason"
//  }
//}
