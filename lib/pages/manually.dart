import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_decanat/pages/verification.dart';

class Manually extends StatefulWidget {
  Manually({Key key}) : super(key: key);
  @override
  _ManuallyState createState() => _ManuallyState();
}

class _ManuallyState extends State<Manually> {
  TextEditingController _supervisor;
  TextEditingController _room;
  TextEditingController _date;
  TextEditingController _timeRange;

  @override
  void initState() {
    super.initState();
    _supervisor = TextEditingController();
    _room = TextEditingController();
    _date = TextEditingController();
    _timeRange = TextEditingController();
  }

  @override
  void dispose() {
    _supervisor.dispose();
    _room.dispose();
    _date.dispose();
    _timeRange.dispose();
    super.dispose();
  }

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
        // iconSize: 30,
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: width * 0.1,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "Register",
                style: TextStyle(
                  fontFamily: "Roboto-Regular",
                  fontSize: height * width * 0.00015,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: width * 0.1,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "a new monitoring manually",
                style: TextStyle(
                  fontFamily: "Roboto-Thin",
                  fontSize: height * width * 0.0001,
                ),
              ),
            ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.only(
                top: height * width * 0.0002,
              ),
              child: TextField(
                controller: _supervisor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Supervisor",
                  helperText: "Type and select the supervisor",
                  suffix: Icon(Icons.person),
                ),
              ),
            ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              child: TextField(
                controller: _room,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Room",
                  helperText: "Select the room",
                  suffix: Icon(Icons.room),
                ),
              ),
            ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              child: TextField(
                controller: _date,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Date",
                  helperText: "The date of the day",
                  suffix: Icon(Icons.date_range),
                ),
              ),
            ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              child: TextField(
                controller: _timeRange,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Time Range",
                  helperText: "Select the time range",
                  suffix: Icon(Icons.timelapse),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              width: width * 0.9,
              height: height * 0.08,
              child: RaisedButton(
                color: Color(0xff6A4E77),
                textColor: Colors.white,
                child: Text(
                  "SAVE",
                  style: TextStyle(fontFamily: "Roboto-Regular", fontSize: 20),
                ),
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (_) => Verification());
                  Navigator.push(context, route);
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
