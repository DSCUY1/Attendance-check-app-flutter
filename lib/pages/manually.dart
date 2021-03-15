import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_decanat/controls/controller.dart';
import 'package:projet_decanat/pages/verification.dart';
import 'package:projet_decanat/services/parameter.dart';
import 'package:projet_decanat/widgets/customized_app_bar.dart';
import 'package:projet_decanat/widgets/customized_bottom_navigation_bar.dart';
import 'package:projet_decanat/widgets/customized_button.dart';
import 'package:projet_decanat/widgets/auto_complete_input.dart';
import 'package:projet_decanat/widgets/dialog_show.dart';
import 'package:projet_decanat/pages/infos.dart';
import 'package:projet_decanat/widgets/subtitle_text.dart';
import 'package:projet_decanat/widgets/title_text.dart';

import 'package:projet_decanat/pages/home.dart';

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

  List<String> supervisorsNames;
  List<String> roomsNames;
  List<String> timeRanges;

  @override
  void initState() {
    super.initState();
    _supervisor = TextEditingController();
    _room = TextEditingController();
    _date = TextEditingController();
    _timeRange = TextEditingController();

    // supervisorsNames = Parameter.supervisors.map((Supervisor sup) {
    //   return sup.first_name + " " + sup.last_name;
    // }).toList();
    supervisorsNames = List<String>();
    for (var sup in Parameter.supervisors) {
      supervisorsNames.add(sup.first_name + " " + sup.last_name);
    }
    print(supervisorsNames);

    roomsNames = List<String>();
    for (var room in Parameter.rooms) {
      roomsNames.add(room.libelle + ": " + room.code);
    }
    print(roomsNames);

    // print(Parameter.rooms);
    timeRanges = List<String>();
    for (var tm in Parameter.timeRanges) {
      timeRanges.add(tm.begin + " - " + tm.end);
    }
    print(timeRanges);
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
    MaterialPageRoute route = MaterialPageRoute(
        builder: (_) => Verification(
            "Abdel Aziz MFOSSA", "103", "2/24/21", "NB4", "2pm - 4pm"));
    // Navigator.pop(context);
    Navigator.pushReplacement(context, route);
  }

  void chek() {
    List<String> supName = _supervisor.text.split(" ");
    for (var sup in Parameter.supervisors) {
      if (supName[0] == sup.first_name && supName[1] == sup.last_name) {
        print("sup trouvee");
        String roomCode = _room.text.split(": ")[1];
        for (var room in Parameter.rooms) {
          if (roomCode == room.code) {
            print("room trouvee");
            List<String> tm = _timeRange.text.split(" - ");
            for (var timeRange in Parameter.timeRanges) {
              if (timeRange.begin == tm[0] && timeRange.end == tm[1]) {
                print("tm trouvee");
                Map<String, dynamic> checked =
                    Controller.manuallyCheck(sup.id, room.id, timeRange.id);
                if (checked["statut"] == "OK") {
                  print("checked");
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => Verification(
                      checked["sup"].toString(),
                      checked["code"].toString(),
                      checked["date"].toString(),
                      checked["room"].toString(),
                      checked["tm"].toString(),
                    ),
                  );
                  Navigator.push(context, route);
                } else {
                  DialogShow dialog = DialogShow("Erreur", checked["response"]);
                  dialog.showdialog(context);
                }
                break;
              }
            }
            break;
          }
        }
        break;
      }
    }
  }

  Widget build(BuildContext context) {
    // to hide only bottom bar:
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    // to hide only status bar:
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // to hide both:
    SystemChrome.setEnabledSystemUIOverlays([]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    MaterialPageRoute routeHome = MaterialPageRoute(builder: (_) => Home());
    MaterialPageRoute routeManually =
        MaterialPageRoute(builder: (_) => Manually());
    MaterialPageRoute routeInfos = MaterialPageRoute(builder: (_) => Infos());
    return Scaffold(
      appBar: customizedAppBar(context),
      bottomNavigationBar: customizedBottomNavigationBar(
          1, context, routeHome, routeManually, routeInfos),
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
              child: AutoCompleteInput(
                supervisorsNames,
                _supervisor,
                hintText: "Supervisor",
                helpertext: "Type and select the supervisor name",
                icon: Icon(Icons.person, color: Color(0xff6A4E77)),
              ),
              // child: CustomizedInput(
              //   _supervisor,
              //   "Supervisor",
              //   "Type and select the supervisor",
              //   Icon(Icons.person),
              //   obscurcir: false,
              // ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              child: AutoCompleteInput(
                roomsNames,
                _room,
                hintText: "Room",
                helpertext: "Type and select the room",
                icon: Icon(Icons.room, color: Color(0xff6A4E77)),
              ),
              // child: CustomizedInput(
              //   _room,
              //   "Room",
              //   "Select the room",
              //   Icon(Icons.room),
              //   obscurcir: false,
              // ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
            ),
            // Container(
            //   width: width * 0.9,
            //   height: height * 0.1,
            //   margin: EdgeInsets.only(
            //     top: height * width * 0.00005,
            //   ),
            //   child: CustomizedInput(
            //     _date,
            //     "Date",
            //     "The date of the day",
            //     Icon(Icons.date_range),
            //     obscurcir: false,
            //   ),
            // ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              child: AutoCompleteInput(
                timeRanges,
                _timeRange,
                hintText: "Plage Horaire",
                helpertext: "Type and select the Time range",
                icon: Icon(Icons.date_range, color: Color(0xff6A4E77)),
              ),
              // child: CustomizedInput(
              //   _supervisor,
              //   "Time range",
              //   "Select the time range",
              //   Icon(Icons.timelapse),
              //   obscurcir: false,
              // ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
            ),
            Container(
              margin: EdgeInsets.only(
                top: height * width * 0.00005,
              ),
              width: width * 0.9,
              height: height * 0.08,
              child: CustomizedButton(
                "SAVE",
                chek,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
