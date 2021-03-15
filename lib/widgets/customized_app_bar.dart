import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/login.dart';
import 'package:projet_decanat/services/http_helper.dart';
import 'package:projet_decanat/widgets/dialog_show.dart';

AppBar customizedAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color(0xff6A4E77),
    // leading: Builder(
    //   builder: (context) => IconButton(
    //     icon: Icon(
    //       Icons.menu_rounded,
    //       color: Colors.white,
    //     ),
    //     tooltip: "hello",
    //   ),
    // ),
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
              if (response["statut"] == "OK") {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (_) => Login());
                Navigator.pop(context);
                Navigator.push(context, route);
              } else {
                print("Impossible de logout");
                DialogShow dialog = DialogShow("Erreur", response["response"]);
                dialog.showdialog(context);
              }
            },
          );
        },
      ),
    ],
  );
}
