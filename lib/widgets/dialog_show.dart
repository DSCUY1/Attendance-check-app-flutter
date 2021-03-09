import 'package:flutter/material.dart';
import 'package:projet_decanat/widgets/customized_button.dart';
import 'package:projet_decanat/widgets/title_text.dart';
import 'package:projet_decanat/widgets/subtitle_text.dart';

class DialogShow {
  final String title;
  final String description;
  final Color color;
  DialogShow(this.title, this.description, {this.color});
  Future<Null> showdialog(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Center(child: TitleText(title, color: (this.color == null) ? Colors.red : this.color)),
          contentPadding: EdgeInsets.all(height * width * 0.00005),
          children: <Widget>[
            new Container(
              width: width / 2,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SubtitleText(description),
                  CustomizedButton(
                    "OK",
                    () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
