import 'package:flutter/material.dart';

const primaryColorBlue = Color.fromRGBO(53, 80, 218, 1);
const bgColor = Color.fromRGBO(225, 225, 225, 1);

Widget appBar() {
  return AppBar(
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
          onPressed: () {},
        ),
      ),
      Container(
        child: Center(
          child: Text("r0013481"),
        ),
      ),
      Padding(padding: EdgeInsets.all(5)),
    ],
  );
}
