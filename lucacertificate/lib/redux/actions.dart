import 'package:lucacertificate/models/user.dart';

class UpdateIsLogged {
  final User updatedLoggedUser;
  final bool updatedIsLogged;
  UpdateIsLogged(this.updatedIsLogged, this.updatedLoggedUser);
}

class LoginAction {
  final String rNumber, lastName;
  LoginAction(this.rNumber, this.lastName);
}
