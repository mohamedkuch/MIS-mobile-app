import 'package:flutter/material.dart';
import 'package:lucacertificate/globals.dart';
import 'package:lucacertificate/homePage.dart';
import 'package:lucacertificate/views/accessDenied_view.dart';
import 'package:lucacertificate/views/certificates_view.dart';
import 'package:lucacertificate/views/login_view.dart';
import 'package:lucacertificate/views/scan_view.dart';
import 'package:lucacertificate/views/welcome_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: primaryColorBlue,
        // primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginView(),
        '/welcome': (context) => WelcomeView(),
        '/scan': (context) => ScanView(),
        '/Certifactes': (context) => CertifactesView()
      },
      initialRoute: '/',
    );
  }
}
