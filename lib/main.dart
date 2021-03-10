import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/splash.dart';

import 'package:flutter/services.dart';

main() {
  runApp(App());
  //definition de l'orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Check App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color(0xff6A4E77),
      ),
      home: Splash(),
      routes: {
        // '/startPage': (context)=>StartPage()
      },
    );
  }
}
