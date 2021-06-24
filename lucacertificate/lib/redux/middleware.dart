import 'package:flutter_redux/flutter_redux.dart';
import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/models/machine.dart';
import 'package:lucacertificate/models/user.dart';
import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';
import 'package:lucacertificate/services.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

void lucaMiddleware(
  Store<AppState> store,
  action,
  NextDispatcher next,
) async {
  if (action is LoginAction) {
    // Get User details
    final res = await Services.login(action.rNumber, action.lastName);
    print(res);

    // check if user logged in successfully
    if (res['error'] != null) {
      print(res);
    } else {
      User userLogged = res['data'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("userTokenBase64", userLogged.tokenBase64);
      await prefs.setString("rNumber", userLogged.rNumber);
      await prefs.setString("lastName", userLogged.lastName);
      await prefs.setBool("isLogged", true);

      store.dispatch(UpdateIsLogged(true, userLogged));
    }
  } else if (action is UpdateIsLogged) {
    if (action.updatedIsLogged == true) {
      print("getting certificates");

      // Get Certificates
      final res = await Services.getCertificates(
          action.updatedLoggedUser.rNumber,
          action.updatedLoggedUser.tokenBase64);
      print(res);

      if (res['error'] != null) {
        print(res);
      } else {
        List<Certificate> certificateList = res['data'];
        store.dispatch(UpdateCertificatesAction(
          action.updatedIsLogged,
          action.updatedLoggedUser,
          certificateList,
        ));
      }
    }
  }
  if (action is ScanMachineAction) {
    print("#####" + action.scannedMachineId);
    // Get Scanned Machine
    final res = await Services.getScannedMachine(
        action.scannedMachineId, store.state.loggedUser.tokenBase64);
    print(res);
    if (res['error'] != null) {
      print(res);
    } else {
      Machine scannedMachine = res['data'];

      store.dispatch(
        UpdateScannedMachine(
          scannedMachine,
        ),
      );
    }
  }
  next(action);
}
