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
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // to hide both:
    // SystemChrome.setEnabledSystemUIOverlays([]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6A4E77),
          leading: IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Attendance Check App",
            style: TextStyle(
              fontFamily: "Roboto-Rugular",
            ),
          ),
          actions: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff6A4E77),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          // iconSize: height * width * 0.0002,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner_outlined,
                color: Colors.white,
              ),
              label: 'Scan a badge',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Manually',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.error,
                color: Colors.white,
              ),
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
                margin: EdgeInsets.only(
                  top: height * 0.3,
                ),
                child: Text(
                  "Hello & Welcome",
                  style: TextStyle(
                    fontFamily: "Roboto-Regular",
                    fontSize: height * width * 0.00015,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Tap on '+' button to scan a badge",
                  style: TextStyle(
                    fontFamily: "Roboto-Thin",
                    fontSize: height * width * 0.0001,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
