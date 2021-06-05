import 'package:flutter/material.dart';
import 'package:lucacertificate/globals.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

Widget primaryButton(String title) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(70),
    ),
    height: 60,
    width: double.infinity,
    child: Center(
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
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
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30, top: 30, bottom: 10),
              child: Text(
                "Welcome back !",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30, bottom: 30),
              child: Text(
                "Enter your credentials to continue",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Divider(
                height: 3,
                thickness: 2,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(33),
                    ),
                    child: TextField(
                      onSubmitted: (text) {},
                      onChanged: (text) {},
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(33),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(33),
                        ),
                        hintText: 'User-id',
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 30, right: 30, bottom: 15),
                        child: primaryButton("Login"),
                      ),
                      Center(
                        child: Text("don't have an account ? "),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 30, right: 30, top: 15, bottom: 10),
                        child: primaryButton("Sign up"),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
