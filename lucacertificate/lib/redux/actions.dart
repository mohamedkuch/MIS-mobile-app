import 'package:lucacertificate/models/certificate.dart';
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

class GetCertificatesAction {
  GetCertificatesAction();
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
