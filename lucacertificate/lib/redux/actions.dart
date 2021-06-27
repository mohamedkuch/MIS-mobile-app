import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/models/machine.dart';
import 'package:lucacertificate/models/user.dart';
import 'package:lucacertificate/models/workplace.dart';

// ##### Authentication

class UpdateIsLogged {
  final User updatedLoggedUser;
  final bool updatedIsLogged;
  UpdateIsLogged(this.updatedIsLogged, this.updatedLoggedUser);
}

class LoginAction {
  final String rNumber, lastName;
  LoginAction(this.rNumber, this.lastName);
}

class UpdateCertificatesAction {
  final User updatedLoggedUser;
  final bool updatedIsLogged;
  final List<Certificate> updatedCertificateList;
  UpdateCertificatesAction(
    this.updatedIsLogged,
    this.updatedLoggedUser,
    this.updatedCertificateList,
  );
}

class LogoutAction {
  LogoutAction();
}

class UpdateErrorLoginAction {
  final String updatedErrorString;
  UpdateErrorLoginAction(this.updatedErrorString);
}

// ##### Scan QR for Machine

class ScanMachineAction {
  final String scannedMachineId;
  ScanMachineAction(this.scannedMachineId);
}

class UpdateScannedMachine {
  final Machine updatedScannedMachine;
  UpdateScannedMachine(this.updatedScannedMachine);
}

class UpdateActiveMachine {
  final Machine updatedActiveMachine;
  UpdateActiveMachine(this.updatedActiveMachine);
}

// ##### Scan Bar code for workplace

class ScanWorkplaceAction {
  final String scannedWorkplaceId;
  ScanWorkplaceAction(this.scannedWorkplaceId);
}

class UpdateActiveWorkplace {
  final Workplace updatedActiveWorkplace;
  UpdateActiveWorkplace(this.updatedActiveWorkplace);
}

class UpdateWorkplaceMachineAction {
  final List<Machine> updatedWorkplaceMachineList;
  UpdateWorkplaceMachineAction(this.updatedWorkplaceMachineList);
}
