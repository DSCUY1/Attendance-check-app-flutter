import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/confirm.dart';
import 'package:projet_decanat/pages/error_page.dart';

class Verification extends StatefulWidget {
  Verification({Key key}) : super(key: key);
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6A4E77),
        title: Text(
          "Verification",
          style: TextStyle(
            fontFamily: "Roboto-Rugular",
          ),
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.more_vert, color: Colors.white),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff6A4E77),
        iconSize: 30,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
            label: 'Scan a badge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Manually',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error, color: Colors.white),
            label: 'Information',
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              child: Text(
                "Verify, then validate",
                style: TextStyle(
                  fontFamily: "Roboto-Regular",
                  fontSize: 35,
                ),
              ),
            ),
            Container(
              child: Text(
                "if these informations are corrects,\nplease presse 'Confirm' button",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "Roboto-Thin",
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: width * 0.9,
              child: Table(
                children: <TableRow>[
                  TableRow(
                    // decoration: Decoration(),
                    children: <Widget>[
                      Text(
                        "Supervisor:",
                        style: TextStyle(
                          fontFamily: "Roboto-Regular",
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Abdel Aziz MFOSSA",
                        style: TextStyle(
                          fontFamily: "Roboto-Thin",
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    // decoration: Decoration(),
                    children: <Widget>[
                      Text(
                        "Code:",
                        style: TextStyle(
                          fontFamily: "Roboto-Regular",
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "103",
                        style: TextStyle(
                          fontFamily: "Roboto-Thin",
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    // decoration: Decoration(),
                    children: <Widget>[
                      Text(
                        "Date:",
                        style: TextStyle(
                          fontFamily: "Roboto-Regular",
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "2/24/21",
                        style: TextStyle(
                          fontFamily: "Roboto-Thin",
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                  TableRow(
                    // decoration: Decoration(),
                    children: <Widget>[
                      Text(
                        "Room:",
                        style: TextStyle(
                          fontFamily: "Roboto-Regular",
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "NB4",
                        style: TextStyle(
                          fontFamily: "Roboto-Thin",
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                  TableRow(
                    // decoration: Decoration(),
                    children: <Widget>[
                      Text(
                        "Time range:",
                        style: TextStyle(
                          fontFamily: "Roboto-regular",
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "2pm - 4pm",
                        style: TextStyle(
                          fontFamily: "Roboto-Thin",
                          fontWeight: FontWeight.w200,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: width * 0.4,
                      height: height * 0.08,
                      child: RaisedButton(
                        color: Color(0xff6A4E77),
                        textColor: Colors.white,
                        onPressed: () {
                          MaterialPageRoute route =
                              MaterialPageRoute(builder: (_) => ErrorPage());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          "RE-SCAN",
                          style: TextStyle(
                              fontFamily: "Roboto-Regular", fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: width * 0.4,
                      height: height * 0.08,
                      child: RaisedButton(
                        color: Color(0xff6A4E77),
                        textColor: Colors.white,
                        onPressed: () {
                          MaterialPageRoute route =
                              MaterialPageRoute(builder: (_) => Confirm());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          "CONFIRM",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
