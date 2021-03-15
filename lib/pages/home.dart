import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_decanat/pages/manually.dart';
import 'package:projet_decanat/pages/scanner_page.dart';
import 'package:projet_decanat/services/http_helper.dart';
import 'package:projet_decanat/services/parameter.dart';
import 'package:projet_decanat/widgets/customized_app_bar.dart';
import 'package:projet_decanat/widgets/customized_bottom_navigation_bar.dart';
import 'package:projet_decanat/widgets/dialog_show.dart';
import 'package:projet_decanat/pages/infos.dart';
import 'package:projet_decanat/widgets/left_drawer.dart';
import 'package:projet_decanat/widgets/subtitle_text.dart';
import 'package:projet_decanat/widgets/title_text.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    if (!Parameter.welcome) {
      Timer(Duration(milliseconds: 500), () {
        DialogShow dialog = DialogShow(
          "Welcome",
          Parameter.first_name,
          color: Colors.black,
        );
        dialog.showdialog(context);
        Parameter.welcome = true;
        getSupervisors();
        getRooms();
        getTimeRange();
      });
    }
  }

  void getSupervisors() {
    HttpHelper.getSurveillants().then((response) {
      if (response["statut"] == "OK") {
      } else {
        DialogShow dialog = DialogShow("Erreur", response["response"]);
        dialog.showdialog(context);
      }
    });
  }

  void getRooms() {
    HttpHelper.getRooms().then((response) {
      if (response["statut"] == "OK") {
      } else {
        DialogShow dialog = DialogShow("Erreur", response["response"]);
        dialog.showdialog(context);
      }
    });
  }

  void getTimeRange() {
    HttpHelper.getTimeRanges().then((response) {
      if (response["statut"] == "OK") {
      } else {
        DialogShow dialog = DialogShow("Erreur", response["response"]);
        dialog.showdialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // to hide only bottom bar:
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
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
      drawer: LeftDrawer(),
      appBar: customizedAppBar(context),
      bottomNavigationBar: customizedBottomNavigationBar(
          0, context, routeHome, routeManually, routeInfos),
      floatingActionButton: FloatingActionButton(
        tooltip: 'New Scan',
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (_) => ScannerPage());
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
              child: TitleText("Hello & Welcome"),
            ),
            Container(
              child: SubtitleText("Tap on '+' button to scan a badge"),
            )
          ],
        ),
      ),
    );
  }
}
