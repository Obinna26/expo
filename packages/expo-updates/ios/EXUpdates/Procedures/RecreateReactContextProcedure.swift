//  Copyright © 2019 650 Industries. All rights reserved.

@_implementationOnly import React
import ExpoModulesCore

final class RecreateReactContextProcedure: StateMachineProcedure {
  private let triggerReloadCommandListenersReason: String
  private let successBlock: () -> Void
  private let errorBlock: (_ error: Exception) -> Void

  init(
    triggerReloadCommandListenersReason: String,
    successBlock: @escaping () -> Void,
    errorBlock: @escaping (_: Exception) -> Void
  ) {
    self.triggerReloadCommandListenersReason = triggerReloadCommandListenersReason
    self.successBlock = successBlock
    self.errorBlock = errorBlock
  }

  func getLoggerTimerLabel() -> String {
    "timer-recreate-react-context"
  }

  func run(procedureContext: ProcedureContext) {
    procedureContext.processStateEvent(UpdatesStateEventRestart())

    DispatchQueue(label: "expo.procedure.RecreateReactContextProcedureQueue").async {
      RCTTriggerReloadCommandListeners(self.triggerReloadCommandListenersReason)
      self.successBlock()
      // Reset the state machine
      procedureContext.resetState()
      procedureContext.onComplete()
    }
  }
}
