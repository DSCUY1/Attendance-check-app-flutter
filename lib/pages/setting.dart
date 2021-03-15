import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_decanat/pages/home.dart';
import 'package:projet_decanat/pages/manually.dart';
import 'package:projet_decanat/services/parameter.dart';
import 'package:projet_decanat/widgets/attribute_text.dart';
import 'package:projet_decanat/widgets/customized_app_bar.dart';
import 'package:projet_decanat/widgets/customized_bottom_navigation_bar.dart';
import 'package:projet_decanat/pages/infos.dart';
import 'package:projet_decanat/widgets/title_text.dart';
import 'package:projet_decanat/widgets/value_text.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: TitleText("Your Informations"),
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
                          AttributeText("First name:"),
                          ValueText(Parameter.first_name),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          AttributeText("Last name:"),
                          ValueText(Parameter.last_name),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          AttributeText("Email:"),
                          ValueText(Parameter.email),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          AttributeText("Phone:"),
                          ValueText(Parameter.phone),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          AttributeText("Matricule:"),
                          ValueText(Parameter.matricule),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
