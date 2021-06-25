import 'package:flutter/material.dart';
import 'package:lucacertificate/models/certificate.dart';

const primaryColorBlue = Color.fromRGBO(53, 80, 218, 1);
const bgColor = Color.fromRGBO(225, 225, 225, 1);

Certificate getCertificateById(certificateList, certificateKey) {
  for (var i = 0; i < certificateList.length; i++) {
    Certificate cert = certificateList[i];

    if (certificateKey == cert.id.toString()) {
      return cert;
    }
  }
  return null;
}

Widget appBar(String rNumber) {
  return AppBar(
    brightness: Brightness.dark,
    leading: Builder(
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(left: 5),
          child: IconButton(
            icon: Image.asset("assets/logo.png"),
            onPressed: () {
              print("logo pressed");
            },
          ),
        );
      },
    ),
    actions: [
      Container(
        child: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
      ),
      Container(
        child: Center(
          child: Text(rNumber),
        ),
      ),
      Padding(padding: EdgeInsets.all(5)),
    ],
  );
}
