import 'package:flutter/material.dart';
import 'package:lucacertificate/globals.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColorBlue,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Expanded(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width * 1,
            //     color: primaryColorBlue,
            //     child: Text("asdasdasdasdasdasdasdasdasd"),
            //   ),
            // ),
            // Expanded(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width * 1,
            //     color: Colors.black,
            //     child: Text("asdasdasdasdasdasdasdasdasd"),
            //   ),
            // ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "CERTIFICATES",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      fontSize: 20,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Divider(
                    indent: 50,
                    endIndent: 50,
                    height: 3,
                    color: Color.fromRGBO(235, 235, 235, 0.2),
                    thickness: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
