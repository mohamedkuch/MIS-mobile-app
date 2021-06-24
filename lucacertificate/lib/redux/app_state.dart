import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/models/machine.dart';
import 'package:lucacertificate/models/user.dart';

class AppState {
  bool isLogged;
  User loggedUser;
  List<Certificate> certificateList = [];
  Machine scannedMachine;

  AppState({
    this.isLogged,
    this.loggedUser,
    this.certificateList,
    this.scannedMachine,
  });

  // factory AppState.initial(){
  //   return AppState(userTokenBase64: null)
  // }
}
