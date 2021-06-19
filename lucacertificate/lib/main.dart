import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lucacertificate/globals.dart';
import 'package:lucacertificate/homePage.dart';
import 'package:lucacertificate/redux/reducer.dart';
import 'package:lucacertificate/views/accessDenied_view.dart';
import 'package:lucacertificate/views/certificates_view.dart';
import 'package:lucacertificate/views/login_view.dart';
import 'package:lucacertificate/views/scan_view.dart';
import 'package:lucacertificate/views/welcome_view.dart';

import 'package:lucacertificate/redux/app_state.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<AppState> _store = Store<AppState>(updateUserTokenReducer,
      initialState: AppState(isLogged: false));

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: 'Certificate App',
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
      ),
    );
  }
}
