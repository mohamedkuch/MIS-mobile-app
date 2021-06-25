import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';

AppState updateUserTokenReducer(AppState currentState, dynamic action) {
  if (action is UpdateIsLogged) {
    return AppState(
      certificateList: currentState.certificateList,
      isLogged: action.updatedIsLogged,
      loggedUser: action.updatedLoggedUser,
    );
  }

  if (action is UpdateCertificatesAction) {
    return AppState(
      isLogged: currentState.isLogged,
      loggedUser: currentState.loggedUser,
      certificateList: action.updatedCertificateList,
    );
  }

  if (action is UpdateMachineListAction) {
    return AppState(
        isLogged: currentState.isLogged,
        loggedUser: currentState.loggedUser,
        certificateList: currentState.certificateList,
        machineList: action.updateMachinesList);
  }

  // ####### Scanning Maching QR
  if (action is UpdateScannedMachine) {
    return AppState(
      isLogged: currentState.isLogged,
      loggedUser: currentState.loggedUser,
      certificateList: currentState.certificateList,
      machineList: currentState.machineList,
      scannedMachine: action.updatedScannedMachine,
    );
  }
  return currentState;
}
