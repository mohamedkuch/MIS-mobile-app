import 'package:flutter/material.dart';
import 'package:lucacertificate/globals.dart';

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

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        color: bgColor,
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.10,
                bottom: MediaQuery.of(context).size.height * 0.10,
              ),
              child: Column(
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
                        "John Doe !",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      "(r0013481)",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 30,
              endIndent: 30,
              height: 3,
              thickness: 2,
            ),
            Expanded(
              child: Container(
                margin:
                    EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: GestureDetector(
                            onTap: () {
                              // on Check certificates pressed
                              print("Check certificates pressed");
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
                          child: GestureDetector(
                            onTap: () {
                              // on Scan pressed
                              print("Scan");
                            },
                            child: buttonHelper(
                                "Scan",
                                true,
                                Icon(
                                  Icons.qr_code,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          // on Logout pressed
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
          ],
        ),
      ),
    );
  }
}
