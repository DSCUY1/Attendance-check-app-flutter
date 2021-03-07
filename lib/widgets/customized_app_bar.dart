import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/login.dart';
import 'package:projet_decanat/services/http_helper.dart';

AppBar customizedAppBar(BuildContext context) {
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
        onPressed: () {
          HttpHelper.logOut().then(
            (response) {
              if (response == "OK") {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (_) => Login());
                Navigator.pop(context);
                Navigator.push(context, route);
              } else {
                print("Impossible de logout");
              }
            },
          );
        },
      ),
    ],
  );
}
