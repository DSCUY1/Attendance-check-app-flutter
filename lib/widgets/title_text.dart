import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String _text;
  Color color = Colors.black;

  TitleText(this._text, {this.color, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Text(
      _text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontFamily: "Roboto-Regular",
        fontSize: height * width * 0.00017,
      ),
    );
  }
}
