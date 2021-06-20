import 'package:flutter/material.dart';
import 'package:lucacertificate/globals.dart';

class CertifactesView extends StatefulWidget {
  CertifactesView({Key key}) : super(key: key);

  @override
  _CertifactesViewState createState() => _CertifactesViewState();
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

class _CertifactesViewState extends State<CertifactesView> {
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
                bottom: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Container(
                child: Text(
                  "Certificates",
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
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: 20,
              itemBuilder: (ctx, int index) {
                return Container(
                  height: 80,
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Card(
                    elevation: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Machine $index",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(left: 30),
                        ),
                        Container(
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                          margin: EdgeInsets.only(right: 30),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
                padding: EdgeInsets.all(
              MediaQuery.of(context).size.height * 0.05,
            ))
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
