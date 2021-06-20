import 'package:flutter/material.dart';
import 'package:lucacertificate/globals.dart';

class ScanView extends StatefulWidget {
  ScanView({Key key}) : super(key: key);

  @override
  _ScanViewState createState() => _ScanViewState();
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

class _ScanViewState extends State<ScanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("test"),
      body: Container(
        color: bgColor,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Container(
                child: Text(
                  "Scan the QR Code",
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Divider(
              indent: 30,
              endIndent: 30,
              height: 3,
              thickness: 2,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Image.asset(
                "assets/qr_code.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.02,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 60, right: 60),
              child: GestureDetector(
                onTap: () {
                  // on Scan pressed
                  print("Scan");
                },
                child: buttonHelper(
                  "Scan",
                  true,
                  Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('Back'),
        icon: Icon(Icons.arrow_back),
        backgroundColor: Colors.grey.shade900,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
