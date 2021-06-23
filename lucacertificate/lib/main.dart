import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lucacertificate/globals.dart';
import 'package:lucacertificate/homePage.dart';
import 'package:lucacertificate/redux/middleware.dart';
import 'package:lucacertificate/redux/reducer.dart';
import 'package:lucacertificate/views/accessDenied_view.dart';
import 'package:lucacertificate/views/certificates_view.dart';
import 'package:lucacertificate/views/login_view.dart';
import 'package:lucacertificate/views/scan_view.dart';
import 'package:lucacertificate/views/welcome_view.dart';

import 'package:lucacertificate/redux/app_state.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<AppState> _store = Store<AppState>(
    updateUserTokenReducer,
    initialState: AppState(isLogged: false),
    middleware: [lucaMiddleware],
  );
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Certificate App',
        theme: ThemeData(
          primaryColor: primaryColorBlue,
          // primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => HomePage(),
          '/login': (context) => LoginView(),
          '/welcome': (context) => WelcomeView(),
          '/scan': (context) => ScanView(),
          '/certifactes': (context) => CertifactesView(),
          '/certificate-view': (context) => AccessDeniedView()
        },
        initialRoute: '/',
      ),
    );
  }
}
