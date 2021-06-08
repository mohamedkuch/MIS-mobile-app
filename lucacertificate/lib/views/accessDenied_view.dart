import 'package:flutter/material.dart';
import 'package:lucacertificate/globals.dart';

class AccessDeniedView extends StatefulWidget {
  AccessDeniedView({Key key}) : super(key: key);

  @override
  _AccessDeniedViewState createState() => _AccessDeniedViewState();
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

class _AccessDeniedViewState extends State<AccessDeniedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
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
                  "Access denied !",
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Text(
                "You dont have a certain certificate to use the machine.",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              indent: 30,
              endIndent: 30,
              height: 3,
              thickness: 2,
            ),
            Container(
              height: 80,
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Card(
                elevation: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Machine 1",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      margin: EdgeInsets.only(left: 30),
                    ),
                    Container(
                      child: Container(
                        child: Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                      margin: EdgeInsets.only(right: 30),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.05,
              ),
            )
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
