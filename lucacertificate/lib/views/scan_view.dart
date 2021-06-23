// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:lucacertificate/globals.dart';
// import 'package:lucacertificate/redux/app_state.dart';

// class ScanView extends StatefulWidget {
//   ScanView({Key key}) : super(key: key);

//   @override
//   _ScanViewState createState() => _ScanViewState();
// }

// Widget buttonHelper(String title, bool isPrimary, Icon icn) {
//   return Container(
//     decoration: BoxDecoration(
//       color: isPrimary ? Colors.black : Colors.red,
//       borderRadius: BorderRadius.circular(70),
//     ),
//     height: 60,
//     child: Row(
//       children: [
//         Padding(
//             padding: EdgeInsets.only(
//               left: 30,
//             ),
//             child: icn),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.only(
//               right: 30,
//             ),
//             child: Center(
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// class _ScanViewState extends State<ScanView> {
//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, AppState>(
//       converter: (store) => store.state,
//       builder: (context, state) {
//         return Scaffold(
//           appBar: appBar(state.loggedUser.rNumber),
//           body: Container(
//             color: bgColor,
//             child: ListView(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.05,
//                     bottom: MediaQuery.of(context).size.height * 0.03,
//                   ),
//                   child: Container(
//                     child: Text(
//                       "Scan the QR Code",
//                       style: TextStyle(fontSize: 26),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Divider(
//                   indent: 30,
//                   endIndent: 30,
//                   height: 3,
//                   thickness: 2,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 20, left: 40, right: 40),
//                   child: Image.asset(
//                     "assets/qr_code.png",
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(
//                     MediaQuery.of(context).size.height * 0.02,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 60, right: 60),
//                   child: GestureDetector(
//                     onTap: () {
//                       // on Scan pressed
//                       print("### Scan Pressed");
//                     },
//                     child: buttonHelper(
//                       "Scan",
//                       true,
//                       Icon(
//                         Icons.camera_alt_rounded,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButton: FloatingActionButton.extended(
//             onPressed: () {
//               // Add your onPressed code here!
//               Navigator.pop(context);
//             },
//             label: Text('Back'),
//             icon: Icon(Icons.arrow_back),
//             backgroundColor: Colors.grey.shade900,
//           ),
//           floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
//         );
//       },
//     );
//   }
// }
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';

class ScanView extends StatefulWidget {
  @override
  _ScanViewState createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  String qrCodeResult = "Not Yet Scanned";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Message displayed over here
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),

            //Button to scan QR code
            FlatButton(
              padding: EdgeInsets.all(15),
              onPressed: () async {
                String codeSanner =
                    await BarcodeScanner.scan(); //barcode scnner
                setState(() {
                  qrCodeResult = codeSanner;
                });
              },
              child: Text(
                "Open Scanner",
                style: TextStyle(color: Colors.indigo[900]),
              ),
              //Button having rounded rectangle border
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.indigo[900]),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
