import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/confirm.dart';
import 'package:projet_decanat/pages/error_page.dart';

class Verification extends StatefulWidget {
  Verification({Key key}) : super(key: key);
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Container(
          child: Text("Verify, then validate",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 30)),
        ),
        Container(
          child: Text(
              "if these informations are corrects,\nplease presse 'Confirm' button",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red, fontFamily: "Roboto", fontSize: 16)),
        ),
        Container(
            child: Row(children: <Widget>[
          Text("Supervisor:",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
          Text("Abdel Aziz MFOSSA",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w200,
                  fontSize: 17))
        ])),
        Container(
            child: Row(children: <Widget>[
          Text("Code:",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
          Text("103",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w200,
                  fontSize: 17))
        ])),
        Container(
            child: Row(children: <Widget>[
          Text("Date:",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
          Text("2/24/21",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w200,
                  fontSize: 17))
        ])),
        Container(
            child: Row(children: <Widget>[
          Text("Room:",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
          Text("NB4",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w200,
                  fontSize: 17))
        ])),
        Container(
            child: Row(children: <Widget>[
          Text("Time range:",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
          Text("2pm - 4pm",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w200,
                  fontSize: 17))
        ])),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: RaisedButton(
                  onPressed: () {
                    MaterialPageRoute route =
                        MaterialPageRoute(builder: (_) => ErrorPage());
                    Navigator.push(context, route);
                  },
                  child: Text("RE-SCAN",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                          fontSize: 23))),
            ),
            Container(
              child: RaisedButton(
                  onPressed: () {
                    MaterialPageRoute route =
                        MaterialPageRoute(builder: (_) => Confirm());
                    Navigator.push(context, route);
                  },
                  child: Text("CONFIRM",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                          fontSize: 23))),
            )
          ],
        )),
      ])),
    );
  }
}
