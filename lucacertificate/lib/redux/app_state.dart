import 'package:lucacertificate/models/student.dart';

class AppState {
  bool isLogged;
  Student loggedUser;

  AppState({this.isLogged, this.loggedUser});

  // factory AppState.initial(){
  //   return AppState(userTokenBase64: null)
  // }
}
