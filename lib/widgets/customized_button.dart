import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String _text;
  final Function _callback;

  CustomizedButton(this._text, this._callback, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RaisedButton(
      color: Color(0xff6A4E77),
      textColor: Colors.white,
      child: Text(
        _text,
        style: TextStyle(
          fontFamily: "Roboto-Regular",
          fontSize: height * width * 0.00009,
        ),
      ),
      onPressed: _callback,
    );
  }
}
