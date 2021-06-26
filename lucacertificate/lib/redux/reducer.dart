import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';

AppState updateUserTokenReducer(AppState currentState, dynamic action) {
  AppState finalState = currentState;

  if (action is UpdateIsLogged) {
    finalState.isLogged = action.updatedIsLogged;
    finalState.loggedUser = action.updatedLoggedUser;

    return finalState;
  }

  if (action is UpdateCertificatesAction) {
    finalState.certificateList = action.updatedCertificateList;
    return finalState;
  }

  if (action is UpdateMachineListAction) {
    finalState.machineList = action.updateMachinesList;
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

  return currentState;
}
