import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/home.dart';
// import 'package:projet_decanat/services/parameter.dart';
import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:projet_decanat/pages/login.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    print("init");
    Timer(Duration(seconds: 3), () {
      // initialisation();
      MaterialPageRoute route = MaterialPageRoute(builder: (_) => Login());
      Navigator.pop(context);
      Navigator.push(context, route);
    });
  }

  void initialisation() async {
    // final prefs = await SharedPreferences.getInstance();
    // final logged = prefs.getString("logged") ?? 0;
    final dynamic logged = 0;
    if (logged == 0) {
      print("first using");
      MaterialPageRoute route = MaterialPageRoute(builder: (_) => Login());
      Navigator.pop(context);
      Navigator.push(context, route);
    }
    if (logged == "logged") {
      print("yet logged");
      // Parameter.first_name = prefs.getString("first_name");
      // Parameter.last_name = prefs.getString("last_name");
      // Parameter.email = prefs.getString("email");
      // Parameter.matricule = prefs.getString("matricule");
      // Parameter.phone = prefs.getString("phone");
      MaterialPageRoute route = MaterialPageRoute(builder: (_) => Home());
      Navigator.pop(context);
      Navigator.push(context, route);
    } else {
      print("Not yet logged");
      MaterialPageRoute route = MaterialPageRoute(builder: (_) => Login());
      Navigator.pop(context);
      Navigator.push(context, route);
    }
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
