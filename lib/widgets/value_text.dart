import 'package:flutter/material.dart';

class ValueText extends StatelessWidget {
  final String _text;

  ValueText(this._text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Text(
      _text,
      style: TextStyle(
        fontFamily: "Roboto-Thin",
        fontWeight: FontWeight.w200,
        fontSize: height * width * 0.00008,
      ),
    );
  }
}
