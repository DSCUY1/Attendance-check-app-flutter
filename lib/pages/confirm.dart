import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/home.dart';

class Confirm extends StatefulWidget {
  Confirm({Key key}) : super(key: key);
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 150),
              child: Text(
                "Confirmed",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: width * 0.5,
              child: Image.asset('assets/images/validation.png'),
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
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
