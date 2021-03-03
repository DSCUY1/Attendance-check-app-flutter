import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/home.dart';

class ErrorPage extends StatefulWidget {
  ErrorPage({Key key}) : super(key: key);
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 150),
              child: Text(
                "Not recognized",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Image.asset(
                'assets/images/warning.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: RaisedButton(
                color: Color(0xff6A4E77),
                textColor: Colors.white,
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (_) => Home());
                  Navigator.push(context, route);
                },
                child: Text(
                  "+ HOME",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
