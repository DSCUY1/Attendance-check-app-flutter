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
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    // to hide both:
    SystemChrome.setEnabledSystemUIOverlays([]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Save Manually"),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Container(
            child: Text(
          "Register",
          style: TextStyle(
              fontFamily: "Roboto", fontWeight: FontWeight.w400, fontSize: 30),
        )),
        Container(
            child: Text(
          "a new monitoring manually",
          style: TextStyle(
              fontFamily: "Roboto", fontWeight: FontWeight.w400, fontSize: 20),
        )),
        Container(
          width: width * 0.9,
          margin: EdgeInsets.only(top: 40),
          child: TextField(
            controller: _supervisor,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Supervisor",
              helperText: "Type and select the supervisor",
              suffix: Text('Icon'),
            ),
          ),
        ),
        Container(
          width: width * 0.9,
          // margin: EdgeInsets.only(top: 40),
          child: TextField(
            controller: _room,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Room",
              helperText: "Select the room",
              suffix: Text('Icon'),
            ),
          ),
        ),
        Container(
          width: width * 0.9,
          // margin: EdgeInsets.only(top: 40),
          child: TextField(
            controller: _date,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Date",
              helperText: "The date of the day",
              suffix: Text('Icon'),
            ),
          ),
        ),
        Container(
          width: width * 0.9,
          // margin: EdgeInsets.only(top: 40),
          child: TextField(
            controller: _timeRange,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Time Range",
              helperText: "Select the time range",
              suffix: Text('Icon'),
            ),
          ),
        ),
        Container(
          child: RaisedButton(
            child: Text(
              "SAVE",
            ),
            onPressed: () {
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (_) => Verification());
              Navigator.push(context, route);
            },
          ),
        )
      ])),
    );
  }
}
