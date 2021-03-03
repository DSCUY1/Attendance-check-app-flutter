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
    SystemChrome.setEnabledSystemUIOverlays([]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6A4E77),
          leading: IconButton(
            icon: Icon(Icons.menu_rounded, color: Colors.white),
          ),
          title: Text(
            "New Scan",
            style: TextStyle(
              fontFamily: "Roboto-Rugular",
            ),
          ),
          actions: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.more_vert, color: Colors.white),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff6A4E77),
          iconSize: 30,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
              label: 'Scan a badge',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Manually',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.error, color: Colors.white),
              label: 'Information',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'New Scan',
          backgroundColor: Colors.red,
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
                  style: TextStyle(fontFamily: "Roboto-Regular", fontSize: 30),
                ),
              ),
              Container(
                child: Text(
                  "Tap on '+' button to scan a badge",
                  style: TextStyle(fontFamily: "Roboto-Thin", fontSize: 20),
                ),
              )
            ],
          ),
        ));
  }
}
