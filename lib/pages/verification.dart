import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_decanat/pages/confirm.dart';
import 'package:projet_decanat/pages/error_page.dart';
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

class Verification extends StatefulWidget {
  Verification({Key key}) : super(key: key);
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
      appBar: customizedAppBar(),
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
                      ValueText("Abdel Aziz MFOSSA"),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      AttributeText("Code:"),
                      ValueText("103"),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      AttributeText("Date:"),
                      ValueText("2/24/21")
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      AttributeText("Room:"),
                      ValueText("NB4")
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      AttributeText("Time range:"),
                      ValueText("2pm - 4pm"),
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
                          MaterialPageRoute route =
                              MaterialPageRoute(builder: (_) => Confirm());
                          Navigator.pop(context);
                          Navigator.push(context, route);
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
