import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/home.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _username;
  TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
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
    SystemChrome.setEnabledSystemUIOverlays ([]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Image.asset("assets/images/logo_mini.png"),
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Text(
              "Log in",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 40),
            ),
          ),
          Container(
            width: width * 0.9,
            margin: EdgeInsets.only(top: 40),
            child: TextField(
              controller: _username,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Username",
                helperText: "Put your username",
                suffix: Text('Icon'),
              ),
            ),
          ),
          Container(
            width: width * 0.9,
            margin: EdgeInsets.only(top: 20),
            child: TextField(
              controller: _password,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                helperText: "Your password goes here",
                suffix: Text('Icon'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 20),
              ),
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(builder: (_) => Home());
                Navigator.push(context, route);
              },
            ),
          )
        ],
      ),
    ));
  }
}
