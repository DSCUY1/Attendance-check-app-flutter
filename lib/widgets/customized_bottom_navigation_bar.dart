import 'package:flutter/material.dart';

BottomNavigationBar customizedBottomNavigationBar(
    int index,
    BuildContext context,
    MaterialPageRoute route0,
    MaterialPageRoute route1,
    MaterialPageRoute route2) {
  return BottomNavigationBar(
    backgroundColor: Color(0xff6A4E77),
    currentIndex: index,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white60,
    // iconSize: height * width * 0.0002,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.qr_code_scanner_outlined,
          color: Colors.white,
        ),
        label: 'Scan a badge',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        label: 'Manually',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        label: 'Information',
      ),
    ],
    onTap: (int i) {
      if (i == 0) {
        Navigator.push(context, route0);
      }
      if (i == 1) {
        Navigator.push(context, route1);
      }
      if (i == 2) {
        Navigator.push(context, route2);
      }
    },
  );
}
