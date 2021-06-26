import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/models/machine.dart';
import 'package:lucacertificate/models/user.dart';
import 'package:lucacertificate/models/workplace.dart';

class AppState {
  bool isLogged;
  User loggedUser;
  List<Certificate> certificateList = [];
  List<Machine> machineList = [];
  List<Workplace> workplaceList = [];

  Machine scannedMachine;
  Machine activeMachine;

  AppState({
    this.isLogged,
    this.loggedUser,
    this.certificateList,
    this.scannedMachine,
    this.activeMachine,
    this.machineList,
    this.workplaceList,
  });
}
