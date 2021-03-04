import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_decanat/pages/verification.dart';
import 'package:projet_decanat/widgets/customized_app_bar.dart';
import 'package:projet_decanat/widgets/customized_bottom_navigation_bar.dart';
import 'package:projet_decanat/widgets/customized_button.dart';
import 'package:projet_decanat/widgets/customized_input.dart';
import 'package:projet_decanat/widgets/subtitle_text.dart';
import 'package:projet_decanat/widgets/title_text.dart';

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

  void changePage() {
    MaterialPageRoute route = MaterialPageRoute(builder: (_) => Verification());
    Navigator.pop(context);
    Navigator.push(context, route);
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
      appBar: customizedAppBar(),
      bottomNavigationBar: customizedBottomNavigationBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: width * 0.1,
              ),
              alignment: Alignment.centerLeft,
              child: TitleText("Register"),
            ),
            Container(
              margin: EdgeInsets.only(
                left: width * 0.1,
              ),
              alignment: Alignment.centerLeft,
              child: SubtitleText("a new monitoring manually"),
            ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.only(
                top: height * width * 0.0002,
              ),
              child: CustomizedInput(
                _supervisor,
                "Supervisor",
                "Type and select the supervisor",
                Icon(Icons.person),
              ),
            ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              child: CustomizedInput(
                _room,
                "Room",
                "Select the room",
                Icon(Icons.room),
              ),
            ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              child: CustomizedInput(
                _date,
                "Date",
                "The date of the day",
                Icon(Icons.date_range),
              ),
            ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              child: CustomizedInput(
                _supervisor,
                "Time range",
                "Select the time range",
                Icon(Icons.timelapse),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              width: width * 0.9,
              height: height * 0.08,
              child: CustomizedButton(
                "SAVE",
                changePage,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
