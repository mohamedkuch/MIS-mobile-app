import 'package:lucacertificate/models/student.dart';

class AppState {
  String userTokenBase64;
  Student loggedUser;

  AppState({this.userTokenBase64 = ""});

  // factory AppState.initial(){
  //   return AppState(userTokenBase64: null)
  // }
}
