import 'package:flutter/material.dart';
import 'package:projet_decanat/services/parameter.dart';
import 'package:projet_decanat/widgets/menu_list_tile.dart';
import 'package:projet_decanat/widgets/subtitle_text.dart';

class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: Icon(
              Icons.face,
              size: 48.0,
              color: Colors.white,
            ),
            accountName:
                SubtitleText(Parameter.first_name + " " + Parameter.last_name),
            accountEmail: Text(Parameter.email),
            otherAccountsPictures: <Widget>[
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              )
            ],
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/baniere.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          MenuListTile(),
        ],
      ),
    );
  }
}
