import 'package:flutter/material.dart';

AppBar customizedAppBar() {
  return AppBar(
    backgroundColor: Color(0xff6A4E77),
    leading: IconButton(
      icon: Icon(
        Icons.menu_rounded,
        color: Colors.white,
      ),
    ),
    title: Text(
      "Attendance Check App",
      style: TextStyle(
        fontFamily: "Roboto-Rugular",
      ),
    ),
    actions: <Widget>[
      IconButton(
        color: Colors.white,
        icon: Icon(
          Icons.logout,
          color: Colors.white,
        ),
      )
    ],
  );
}
