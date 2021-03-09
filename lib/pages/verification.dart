import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_decanat/pages/confirm.dart';
import 'package:projet_decanat/pages/home.dart';
import 'package:projet_decanat/pages/manually.dart';
import 'package:projet_decanat/pages/scanner_page.dart';
import 'package:projet_decanat/widgets/attribute_text.dart';
import 'package:projet_decanat/widgets/customized_app_bar.dart';
import 'package:projet_decanat/widgets/customized_bottom_navigation_bar.dart';
import 'package:projet_decanat/widgets/customized_button.dart';
import 'package:projet_decanat/widgets/infos.dart';
import 'package:projet_decanat/widgets/subtitle_text.dart';
import 'package:projet_decanat/widgets/title_text.dart';
import 'package:projet_decanat/widgets/value_text.dart';
import 'package:projet_decanat/services/http_helper.dart';

class Verification extends StatelessWidget {
  final String supervisor;
  final String code;
  final String date;
  final String room;
  final String timerange;
  Verification(this.supervisor, this.code, this.date, this.room, this.timerange,
      {Key key})
      : super(key: key);

  void confirm(BuildContext context) {
    HttpHelper.markSupervisor(this.code).then(
      (response) {
        if (response == "OK") {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (_) => Confirm());
          // Navigator.pop(context);
          Navigator.pushReplacement(context, route);
        }
      },
    );
  }

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

    MaterialPageRoute routeHome = MaterialPageRoute(builder: (_) => Home());
    MaterialPageRoute routeManually =
        MaterialPageRoute(builder: (_) => Manually());
    MaterialPageRoute routeInfos = MaterialPageRoute(builder: (_) => Infos());
    return Scaffold(
      appBar: customizedAppBar(context),
      bottomNavigationBar: customizedBottomNavigationBar(
          0, context, routeHome, routeManually, routeInfos),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              child: TitleText("Verify, then validate"),
            ),
            Container(
              child: SubtitleText(
                "if these informations are corrects,\nplease presse 'Confirm' button",
                color: Colors.red,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: height * 0.08,
              ),
              width: width * 0.9,
              child: Table(
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      AttributeText("Supervisor:"),
                      ValueText(supervisor),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      AttributeText("Code:"),
                      ValueText(code),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[AttributeText("Date:"), ValueText(date)],
                  ),
                  TableRow(
                    children: <Widget>[AttributeText("Room:"), ValueText(room)],
                  ),
                  TableRow(
                    children: <Widget>[
                      AttributeText("Time range:"),
                      ValueText(timerange),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  top: height * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: width * 0.4,
                      height: height * 0.08,
                      child: CustomizedButton(
                        "RE_SCAN",
                        () {
                          MaterialPageRoute route =
                              MaterialPageRoute(builder: (_) => ScannerPage());
                          Navigator.pop(context);
                          Navigator.push(context, route);
                        },
                      ),
                    ),
                    Container(
                      width: width * 0.4,
                      height: height * 0.08,
                      child: CustomizedButton(
                        "CONFIRM",
                        () {
                          confirm(context);
                        },
                      ),
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
