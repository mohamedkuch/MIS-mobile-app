import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lucacertificate/globals.dart';
import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';

class ScanView extends StatefulWidget {
  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  bool isScanningQR = false;
  String qrScanned;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      onWillChange: (prevState, state) {
        if (this.isScanningQR) {
          // IF QR Code scanned
          if (this.qrScanned.startsWith("qr-")) {
            for (var i = 0; i < state.certificateList.length; i++) {
              Certificate cert = state.certificateList[i];

              if (state.scannedMachine.certificateKey == cert.id.toString()) {
                Navigator.of(context).pushNamed(
                  '/certificate-view',
                  arguments: {
                    'data': state.certificateList[i],
                    'isScanView': true
                  },
                );
              }
            }
          }

          // If workplace scanned

          setState(() {
            this.isScanningQR = false;
            this.qrScanned = null;
          });
        }

        return null;
      },
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
                    onTap: () async {
                      setState(() {
                        this.isScanningQR = true;
                        // bar code
                        // this.qrScanned = "bc-60d38d2689af3c079c687aa7";
                        // qr code
                        this.qrScanned = "qr-60d38d2689af3c079c687aa7";
                      });

                      if (this.qrScanned.startsWith("qr-")) {
                        var machineId = this.qrScanned.substring(3);

                        StoreProvider.of<AppState>(context).dispatch(
                          ScanMachineAction(machineId),
                        );
                      } else if (this.qrScanned.startsWith("br-")) {
                      } else {
                        setState(() {
                          this.isScanningQR = false;
                        });
                      }

                      // String codeSanner =
                      //     await BarcodeScanner.scan(); //barcode scnner
                      // this.setState(() {
                      //   this.qrScanned = codeSanner;
                      // });

                      // // QR Code
                      // if (this.qrScanned.startsWith("qr-")) {
                      //   var machineId = this.qrScanned.substring(3);

                      //   StoreProvider.of<AppState>(context).dispatch(
                      //     ScanMachineAction(machineId),
                      //   );
                      //   setState(() {
                      //     this.isScanningQR = true;
                      //   });
                      // }
                    },
                    child: buttonHelper(
                      "Scan",
                      true,
                      Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                      ),
                      this.isScanningQR,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Message displayed over here

                      Text(state.scannedMachine == null
                          ? ""
                          : state.scannedMachine.name)
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Add your onPressed code here!
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

Widget buttonHelper(String title, bool isPrimary, Icon icn, bool isScanningQR) {
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
              child: isScanningQR
                  ? Container(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                      height: 20,
                      width: 20,
                    )
                  : Text(
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
