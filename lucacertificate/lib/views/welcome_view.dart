import 'package:flutter/material.dart';
import 'package:lucacertificate/globals.dart';

class WelcomeView extends StatefulWidget {
  WelcomeView({Key key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(left: 5),
              child: IconButton(
                icon: Image.asset("assets/logo.png"),
                onPressed: () {
                  print("logo pressed");
                },
              ),
            );
          },
        ),
        actions: [
          Container(
            child: IconButton(
              icon: const Icon(Icons.person),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ),
          Container(
            child: Center(
              child: Text("r0013481"),
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
        ],
      ),
      body: Container(
        child: Text("tttt"),
      ),
    );
  }
}
