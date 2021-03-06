import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet_decanat/pages/home.dart';
import 'package:projet_decanat/widgets/customized_button.dart';
import 'package:projet_decanat/widgets/title_text.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  ErrorPage({this.message, key}) : super(key: key);

  void changePage(BuildContext context) {
    // MaterialPageRoute route = MaterialPageRoute(builder: (_) => Home());
    Navigator.pop(context);
    // Navigator.push(context, route);
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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                // margin: EdgeInsets.only(
                //     // top: 150,
                //     ),
                child: TitleText((this.message == null) ? "Not recognized" : this.message),
              ),
              Container(
                height: height * 0.25,
                width: width * 0.5,
                margin: EdgeInsets.only(
                  top: height * 0.1,
                ),
                child: Image.asset(
                  'assets/images/warning.png',
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.1,
                ),
                child: CustomizedButton(
                  "+ HOME",
                  () => changePage(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
