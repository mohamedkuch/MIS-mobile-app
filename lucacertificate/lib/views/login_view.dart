import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lucacertificate/globals.dart';
import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';

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
  bool loggingIn = false;
  String errorLogin = "";

  @override
  void initState() {
    super.initState();

    setState(() {
      _rNumber = "";
      _lastName = "";
      errorLogin = '';
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
          print("### state changed");
          if (state.loggedUser != null && loggingIn == true) {
            setState(() {
              this.loggingIn = false;
            });
            Navigator.of(context).pushNamed(
              '/welcome',
            );
          }
          print(state.loginError);
          if (state.loginError != null) {
            if (state.loginError != "") {
              setState(() {
                this.loggingIn = false;
                this.errorLogin = state.loginError;
              });
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
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
                        padding:
                            EdgeInsets.only(left: 30, right: 30, bottom: 10),
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
                                  });
                                },
                                onChanged: (text) {
                                  setState(() {
                                    _rNumber = text;
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
                                  });
                                },
                                onChanged: (text) {
                                  setState(() {
                                    _lastName = text;
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
                            this.errorLogin.length > 0
                                ? Text(
                                    this.errorLogin,
                                    style: TextStyle(color: Colors.red),
                                  )
                                : Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 30, right: 30, bottom: 15),
                                  child: this.loggingIn
                                      ? Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(70),
                                          ),
                                          height: 60,
                                          child: Center(
                                            child: Container(
                                              child: CircularProgressIndicator(
                                                backgroundColor: Colors.white,
                                              ),
                                              height: 20,
                                              width: 20,
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              this.errorLogin = '';
                                            });
                                            if (this._lastName == '' ||
                                                this._rNumber == '') {
                                              setState(() {
                                                this.errorLogin =
                                                    'rNumber and Last name must not be Empty';
                                              });
                                            }
                                            print('#### login : ' +
                                                this.errorLogin);
                                            if (this.errorLogin.length == 0) {
                                              setState(() {
                                                this.loggingIn = true;
                                              });
                                              // on Login pressed
                                              StoreProvider.of<AppState>(
                                                      context)
                                                  .dispatch(
                                                //LoginAction("r0013332", "Kechaou"),
                                                LoginAction(
                                                    _rNumber, _lastName),
                                              );
                                            }
                                          },
                                          child: primaryButtonHelper("Login"),
                                        ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
