import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lucacertificate/globals.dart';
import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/models/machine.dart';
import 'package:lucacertificate/redux/app_state.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(date);
  print(formatted);
  return formatted;
}

class AccessGranted extends StatelessWidget {
  const AccessGranted({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map dataArguments = ModalRoute.of(context).settings.arguments;
    final Certificate selectedCert = dataArguments['data'];
    bool isScanView = dataArguments['isScanView'];

    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
          appBar: appBar(state.loggedUser.rNumber),
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
                      selectedCert.name,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    "You have  aquired this certificate after successfully completed the training.",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.date_range_rounded,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 8,
                          top: 4,
                          bottom: 4,
                          right: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade800,
                        ),
                        child: Text(
                          formatDate(selectedCert.date),
                          style: TextStyle(color: Colors.white),
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
                Container(
                  height: 80,
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            selectedCert.name,
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
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Text(
                    "Overview",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Text(
                    selectedCert.body,
                    style: TextStyle(height: 1.6),
                  ),
                ),
                safetyCardView(isScanView, state.scannedMachine),
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
              Navigator.pop(context);
            },
            label: Text('Back'),
            icon: Icon(Icons.arrow_back),
            backgroundColor: Colors.grey.shade900,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        );
      },
    );
  }
}

Widget safetyCardView(bool isScanView, Machine scannedMachine) {
  if (isScanView) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 3,
            thickness: 2,
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            child: Text(
              "Machine Specs",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: Text("Name : " + scannedMachine.name),
          ),
          Container(
            child: Image.network(scannedMachine.safetyCardUrl),
          )
        ],
      ),
    );
  }
  return Padding(padding: EdgeInsets.all(0));
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
