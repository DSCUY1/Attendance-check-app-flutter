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
    SystemChrome.setEnabledSystemUIOverlays([]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(top: 0),
              child: Image.asset("assets/images/logo_mini.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "Log in",
                style: TextStyle(fontFamily: "Roboto-Regular", fontSize: 45),
              ),
            ),
            Container(
              width: width * 0.9,
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  helperText: "Put your username",
                  suffix: Icon(Icons.person),
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
                  suffix: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: width * 0.9,
              height: height * 0.08,
              child: RaisedButton(
                color: Color(0xff6A4E77),
                textColor: Colors.white,
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontFamily: "Roboto-Regular", fontSize: 20),
                ),
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (_) => Home());
                  Navigator.push(context, route);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
