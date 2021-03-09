import 'package:flutter/material.dart';

class CustomizedInput extends StatelessWidget {
  final TextEditingController _controller;
  final String _labelText;
  final String _helperText;
  final Widget _icon;
  bool obscurcir = false;

  CustomizedInput(
      this._controller, this._labelText, this._helperText, this._icon,
      {this.obscurcir, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: obscurcir,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: _labelText,
        helperText: _helperText,
        suffix: _icon,
      ),
    );
  }
}
