import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:projet_decanat/pages/login.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  TextEditingController _username;
  TextEditingController _password;
  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
    print("init");
    Timer(Duration(seconds: 3), () {
      MaterialPageRoute route = MaterialPageRoute(builder: (_) => Login());
      Navigator.pop(context);
      Navigator.push(context, route);
    });
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // to hide only bottom bar:
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    // to hide only status bar:
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    // to hide both:
    SystemChrome.setEnabledSystemUIOverlays([]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.1,
                ),
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.05,
                ),
                child: Text(
                  "With me, simply mark your presence !!!\nThat's a fact. :)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto-Thin",
                    fontSize: height * width * 0.00007,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.4,
                ),
                child: Text(
                  "Design by",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: height * 0.1,
                width: width * 0.5,
                child: Image.asset('assets/logos/DSC-Logo3.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
