import 'package:flutter/material.dart';

BottomNavigationBar customizedBottomNavigationBar() {
  return BottomNavigationBar(
    backgroundColor: Color(0xff6A4E77),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
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
  );
}
