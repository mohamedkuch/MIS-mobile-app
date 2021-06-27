import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';

AppState updateUserTokenReducer(AppState currentState, dynamic action) {
  AppState finalState = currentState;
  // ######## Authentication
  if (action is UpdateIsLogged) {
    finalState.isLogged = action.updatedIsLogged;
    finalState.loggedUser = action.updatedLoggedUser;

    return finalState;
  }

  if (action is UpdateCertificatesAction) {
    finalState.certificateList = action.updatedCertificateList;
    return finalState;
  }

  if (action is LogoutAction) {
    return AppState();
  }

  if (action is UpdateErrorLoginAction) {
    finalState.loginError = action.updatedErrorString;
    return finalState;
  }

  // ####### Scanning Maching QR
  if (action is UpdateScannedMachine) {
    finalState.scannedMachine = action.updatedScannedMachine;
    return finalState;
  }

  // ####### Active Maching QR
  if (action is UpdateActiveMachine) {
    finalState.activeMachine = action.updatedActiveMachine;
    return finalState;
  }

  // ####### Active Workplace from Barcode
  if (action is UpdateActiveWorkplace) {
    finalState.activeWorkplace = action.updatedActiveWorkplace;
    return finalState;
  }

  // ###### Get Workplace Machines List
  if (action is UpdateWorkplaceMachineAction) {
    finalState.workplaceMachineList = action.updatedWorkplaceMachineList;
    return finalState;
  }

  return currentState;
}
