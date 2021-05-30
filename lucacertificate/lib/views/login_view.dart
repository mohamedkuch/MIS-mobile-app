import 'package:flutter/material.dart';
import 'package:lucacertificate/globals.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: primaryColorBlue,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(100)),
                  ),
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                Positioned(
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
