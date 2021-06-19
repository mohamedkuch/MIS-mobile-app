import 'package:lucacertificate/models/user.dart';

class AppState {
  bool isLogged;
  User loggedUser;

  AppState({this.isLogged, this.loggedUser});

  // factory AppState.initial(){
  //   return AppState(userTokenBase64: null)
  // }
}
