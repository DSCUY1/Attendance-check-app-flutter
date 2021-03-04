import 'package:flutter/material.dart';

class AttributeText extends StatelessWidget {
  final String _text;

  AttributeText(this._text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Text(
      _text,
      style: TextStyle(
        fontFamily: "Roboto-Regular",
        fontSize: height * width * 0.0001,
      ),
    );
  }
}
