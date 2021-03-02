import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/manually.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // to hide only bottom bar:
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    // to hide only status bar:
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    // to hide both:
    SystemChrome.setEnabledSystemUIOverlays ([]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text("New Scan")),
        floatingActionButton: FloatingActionButton(
          // onPressed: _incrementCounter,
          tooltip: 'New Scan',
          child: Icon(Icons.add),
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (_) => Manually());
            Navigator.push(context, route);
          },
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: height * 0.38),
                child: Text(
                  "Hello & Welcome",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontSize: 30),
                ),
              ),
              Container(
                child: Text(
                  "Tap on '+' button to scan a badge",
                  style: TextStyle(fontFamily: "Roboto", fontSize: 20),
                ),
              )
            ],
          ),
        ));
  }
}
