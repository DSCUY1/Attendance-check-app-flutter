import 'package:flutter/material.dart';
import 'package:projet_decanat/widgets/subtitle_text.dart';

class MenuListTile extends StatefulWidget {
  @override
  _MenuListTileState createState() => _MenuListTileState();
}

class _MenuListTileState extends State<MenuListTile> {
  TextStyle style = TextStyle(fontFamily: "Roboto-thin");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.calendar_today_outlined,
            color: Color(0xff6A4E77),
          ),
          title: Text(
            'Planing',
            style: style,
          ),
          onTap: () {
            // Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Birthdays(),
            //   ),
            // );
          },
        ),
        Divider(color: Colors.grey),
        ListTile(
          leading: Icon(
            Icons.track_changes_rounded,
            color: Color(0xff6A4E77),
          ),
          title: Text(
            'Cotats',
            style: style,
          ),
          onTap: () {
            // Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Gratitude(),
            //   ),
            // );
          },
        ),
        Divider(color: Colors.grey),
        ListTile(
          leading: Icon(
            Icons.timelapse,
            color: Color(0xff6A4E77),
          ),
          title: Text(
            'Reminders',
            style: style,
          ),
          onTap: () {
            // Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Reminders(),
            //   ),
            // );
          },
        ),
        Divider(color: Colors.grey),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Color(0xff6A4E77),
          ),
          title: Text(
            'Setting',
            style: style,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Divider(color: Colors.grey),
      ],
    );
  }
}
