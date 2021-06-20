import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lucacertificate/globals.dart';
import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

Widget primaryButtonHelper(String title) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(70),
    ),
    height: 60,
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class _LoginViewState extends State<LoginView> {
  String _rNumber = "";
  String _lastName = "";

  @override
  void initState() {
    super.initState();

    setState(() {
      _rNumber = "";
      _lastName = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        onWillChange: (prevState, state) {
          if (state.isLogged) {
            Navigator.pushNamed(context, '/welcome');
          }
          return null;
        },
        builder: (context, state) {
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
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100)),
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
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Divider(
                      height: 3,
                      thickness: 2,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // rNumber TextField
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(33),
                          ),
                          child: TextField(
                            onSubmitted: (text) {
                              setState(() {
                                _rNumber = text;
                                print("### _rNumber : " + text);
                              });
                            },
                            onChanged: (text) {
                              setState(() {
                                _rNumber = text;
                                print("### _rNumber : " + text);
                              });
                            },
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
                              hintText: 'rNumber',
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        // LastName Textfield
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(33),
                          ),
                          child: TextField(
                            onSubmitted: (text) {
                              setState(() {
                                _lastName = text;
                                print("### lastName : " + text);
                              });
                            },
                            onChanged: (text) {
                              setState(() {
                                _lastName = text;
                                print("### lastName : " + text);
                              });
                            },
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
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: 30, right: 30, bottom: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    // on Login pressed
                                    StoreProvider.of<AppState>(context)
                                        .dispatch(
                                      LoginAction("r0013332", "Kechaou"),
                                      //LoginAction(_rNumber, _lastName),
                                    );
                                  },
                                  child: primaryButtonHelper("Login"),
                                )),
                            // Center(
                            //   child: Text("don't have an account ? "),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.only(
                            //       left: 30, right: 30, top: 15, bottom: 10),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       // on Sign up pressed
                            //       print("Sign up pressed");
                            //     },
                            //     child: primaryButtonHelper("Sign up"),
                            //   ),
                            // ),
                          ],
                        ),
                        // Padding(padding: EdgeInsets.all(5)),
                        Text(state.isLogged.toString())
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
