import 'package:lucacertificate/globals.dart';
import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/models/machine.dart';
import 'package:lucacertificate/models/user.dart';
import 'package:lucacertificate/models/workplace.dart';
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

    // Post Login
    print("##### Login user");
    print(res);

    // check if user logged in successfully
    if (res['error'] != null) {
      // Error sending request
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
      // Get Certificates
      final res = await Services.getCertificates(
          action.updatedLoggedUser.rNumber,
          action.updatedLoggedUser.tokenBase64);
      print("######## getting certificates");
      print(res);

      if (res['error'] != null) {
        // Error sending request
      } else {
        List<Certificate> certificateList = res['data'];
        store.dispatch(UpdateCertificatesAction(
          action.updatedIsLogged,
          action.updatedLoggedUser,
          certificateList,
        ));
      }

      // Get Machines
      final resMachines =
          await Services.getMachines(action.updatedLoggedUser.tokenBase64);
      print("#### Getting Machines List ");
      print(resMachines);

      if (resMachines['error'] != null) {
        // Error sending request
      } else {
        List<Machine> machineList = resMachines['data'];
        store.dispatch(
          UpdateMachineListAction(machineList),
        );
      }
    }
  }

  if (action is ScanWorkplaceAction) {
    print("##### Scanning Workplace id" + action.scannedWorkplaceId);
    // Get Scanned Workplace
    final res = await Services.getScannedWorkplace(
      action.scannedWorkplaceId,
      store.state.loggedUser.tokenBase64,
    );

    print("##### Getting scanned Workplace ");
    print(res);
    if (res['error'] != null) {
      print("######## erroooor");
      // Error sending request
    } else {
      Workplace scannedWorkplace = res['data'];
      store.dispatch(
        UpdateActiveWorkplace(scannedWorkplace),
      );

      // Post Enter Workplace
      final resPostEnterWorkplace = await Services.postEnterWorkplace(
        scannedWorkplace.workplaceNumber,
        store.state.loggedUser.rNumber,
        store.state.loggedUser.tokenBase64,
      );
      print("##### posting student enters workplace");
      print(resPostEnterWorkplace);
    }
  }
  if (action is ScanMachineAction) {
    print("##### Scanning Machine id" + action.scannedMachineId);
    // Get Scanned Machine
    final res = await Services.getScannedMachine(
        action.scannedMachineId, store.state.loggedUser.tokenBase64);

    print("##### Getting scanned Machine ");
    print(res);

    if (res['error'] != null) {
      print("######## erroooor");
      // Error sending request
    } else {
      Machine scannedMachine = res['data'];
      store.dispatch(
        UpdateScannedMachine(
          scannedMachine,
        ),
      );
      // verify if user has the right to use the machine
      Certificate scannedCert = getCertificateById(
          store.state.certificateList, scannedMachine.certificateKey);

      if (scannedCert != null) {
        // Post Use Machine
        final resPostUseMachine = await Services.postUseMachine(
          scannedMachine.id,
          store.state.loggedUser.rNumber,
          store.state.loggedUser.tokenBase64,
        );
        print("####### user has the right to use machine");
        print(resPostUseMachine);
        store.dispatch(
          UpdateActiveMachine(
            scannedMachine,
          ),
        );
      }
    }
  }

  next(action);
}
