import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lucacertificate/globals.dart';
import 'package:lucacertificate/redux/actions.dart';
import 'package:lucacertificate/redux/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Widget primaryButtonHelper(String title) {
  return Container(
    height: 60,
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  bool isLogged = false;

  @override
  void initState() {
    print("##### Home Page View");

    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        this.isLogged = prefs.getBool("isLogged");
      });
      if (this.isLogged == true) {
        Navigator.of(context).pushNamed(
          '/welcome',
        );

        StoreProvider.of<AppState>(context).dispatch(
          LoginAction(prefs.getString("rNumber"), prefs.getString("lastName")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("##### Home Page View");

    return Scaffold(
      body: Container(
        color: primaryColorBlue,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  Divider(
                    indent: 50,
                    endIndent: 50,
                    height: 3,
                    color: Color.fromRGBO(235, 235, 235, 0.2),
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 40,
                      right: 40,
                      top: 15,
                      bottom: 10,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        child: primaryButtonHelper("Get Started"),
                      ),
                    ),
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
