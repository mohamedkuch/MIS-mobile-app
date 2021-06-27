import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/models/machine.dart';
import 'package:lucacertificate/models/user.dart';
import 'package:lucacertificate/models/workplace.dart';

class AppState {
  bool isLogged;
  User loggedUser;

  List<Certificate> certificateList = [];

  Machine scannedMachine;
  Machine activeMachine;

  Workplace activeWorkplace;
  List<Machine> workplaceMachineList = [];

  AppState({
    this.isLogged,
    this.loggedUser,
    this.certificateList,
    this.scannedMachine,
    this.activeMachine,
    this.activeWorkplace,
    this.workplaceMachineList,
  });
}
