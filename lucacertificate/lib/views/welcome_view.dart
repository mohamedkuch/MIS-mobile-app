import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lucacertificate/globals.dart';
import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeView extends StatefulWidget {
  WelcomeView({Key key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

Widget buttonHelper(String title, bool isPrimary, Icon icn) {
  return Container(
    decoration: BoxDecoration(
      color: isPrimary ? Colors.black : Colors.red,
      borderRadius: BorderRadius.circular(70),
    ),
    height: 60,
    child: Row(
      children: [
        Padding(
            padding: EdgeInsets.only(
              left: 30,
            ),
            child: icn),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: 30,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget activeButtonHelper(String title, Icon icn) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(70),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 3.0,
        ),
      ],
    ),
    height: 60,
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: icn,
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 20,
          ),
          child: Row(
            children: [
              Text(
                "active",
                style: TextStyle(
                  color: Colors.green.shade600,
                  fontSize: 12,
                ),
              ),
              Padding(padding: EdgeInsets.all(2)),
              Icon(
                Icons.circle,
                color: Colors.green.shade600,
                size: 8,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget topViewHelper(AppState state, context) {
  if (state.activeMachine != null || state.activeWorkplace != null) {
    return Column(
      children: [
        state.activeWorkplace != null
            ? Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/workplace-view',
                      arguments: {'data': state.activeWorkplace},
                    );
                  },
                  child: activeButtonHelper(
                    state.activeWorkplace.name,
                    Icon(
                      Icons.home_work_rounded,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                ),
              )
            : Container(
                child: Text("No Active Workplace"),
              ),
        Padding(padding: EdgeInsets.all(20)),
        state.activeMachine != null
            ? Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: GestureDetector(
                  onTap: () {
                    Certificate scannedCert = getCertificateById(
                        state.certificateList,
                        state.activeMachine.certificateKey);

                    if (scannedCert != null) {
                      Navigator.of(context).pushNamed(
                        '/certificate-view',
                        arguments: {'data': scannedCert, 'isScanView': true},
                      );
                    }
                  },
                  child: activeButtonHelper(
                    state.activeMachine.name,
                    Icon(
                      Icons.build_circle_sharp,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                ),
              )
            : Container(
                child: Text("No Active Machines"),
              ),
      ],
    );
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello ",
            style: TextStyle(fontSize: 26),
          ),
          Text(
            state.loggedUser.firstName + " " + state.loggedUser.lastName + " !",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Container(
        child: Text(
          "(" + state.loggedUser.rNumber + ")",
          style: TextStyle(fontSize: 20),
        ),
      ),
    ],
  );
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        if (state.loggedUser == null) {
          return Scaffold(
            body: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            appBar: appBar(state.loggedUser.rNumber),
            body: Container(
              color: bgColor,
              height: MediaQuery.of(context).size.height * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: topViewHelper(state, context),
                  ),
                  Divider(
                    indent: 30,
                    endIndent: 30,
                    height: 3,
                    thickness: 2,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: GestureDetector(
                          onTap: () {
                            // on Check certificates pressed
                            print("Check certificates pressed");
                            Navigator.pushNamed(context, '/certifactes');
                          },
                          child: buttonHelper(
                              "Check Certificates",
                              true,
                              Icon(
                                Icons.assignment,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: GestureDetector(
                          onTap: () {
                            // on Scan pressed
                            print("Scan");
                            Navigator.pushNamed(context, '/scan');
                          },
                          child: buttonHelper(
                            "Scan",
                            true,
                            Icon(
                              Icons.qr_code,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: GestureDetector(
                      onTap: () {
                        // on Logout pressed
                        StoreProvider.of<AppState>(context).dispatch(
                          LogoutAction(),
                        );
                        Navigator.pushNamed(context, '/login');

                        SharedPreferences.getInstance().then((prefs) {
                          prefs.clear();
                        });

                        print("Logout pressed");
                      },
                      child: buttonHelper(
                        "Logout",
                        false,
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
