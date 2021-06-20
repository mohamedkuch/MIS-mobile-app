import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/models/user.dart';

class AppState {
  bool isLogged;
  User loggedUser;
  List<Certificate> certificateList = [];

  AppState({
    this.isLogged,
    this.loggedUser,
    this.certificateList,
  });

  // factory AppState.initial(){
  //   return AppState(userTokenBase64: null)
  // }
}
