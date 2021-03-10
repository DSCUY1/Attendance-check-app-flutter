import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_decanat/pages/home.dart';
import 'package:flutter/services.dart';
import 'package:projet_decanat/services/parameter.dart';
import 'package:projet_decanat/widgets/alert_loader.dart';
import 'package:projet_decanat/widgets/customized_button.dart';
import 'package:projet_decanat/widgets/customized_input.dart';
import 'package:projet_decanat/widgets/dialog_show.dart';
import 'package:projet_decanat/widgets/title_text.dart';
import 'package:projet_decanat/services/http_helper.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email;
  TextEditingController _password;
  bool obscurciInput;
  Icon _eye;
  bool _validated;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    obscurciInput = true;
    _eye = Icon(Icons.remove_red_eye);
    _validated = true;
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void login() {
    MaterialPageRoute route = MaterialPageRoute(builder: (_) => Home());
    Navigator.pop(context);
    Navigator.push(context, route);
    // AlertLoader();
    print("login");
    print(_validated);
    // if (_email.text != "" && _password.text != "") {
    //   setState(() {
    //     _validated = false;
    //   });
    //   String emailIn = _email.text;
    //   String passwordIn = _password.text;
    //   print("email: $emailIn");
    //   print("password: $passwordIn");
    //   HttpHelper.logIn(emailIn, passwordIn).then(
    //     (response) {
    //       if (response == "OK") {
    //         currentuser();
    //         // MaterialPageRoute route = MaterialPageRoute(builder: (_) => Home());
    //         // Navigator.pop(context);
    //         // Navigator.push(context, route);
    //       } else {
    //         DialogShow dialog = DialogShow(
    //           "Erreur",
    //           "Parametres invalides",
    //         );
    //         dialog.showdialog(context);
    //       }
    //       setState(() {
    //         _validated = true;
    //       });
    //     },
    //   );
    // }
  }

  void currentuser() {
    HttpHelper.currentUser().then(
      (response) {
        if (response["statut"] == "OK") {
          if (response["response"] == "2") {
            MaterialPageRoute route = MaterialPageRoute(builder: (_) => Home());
            Navigator.pop(context);
            Navigator.push(context, route);
          } else {
            DialogShow dialog = DialogShow(
              "Erreur",
              "Vous n'etes pas un controller",
            );
            dialog.showdialog(context);
          }
        } else {
          DialogShow dialog = DialogShow(
            "Erreur",
            "Probleme de currentUser",
          );
          dialog.showdialog(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // to hide only bottom bar:
    //SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    // to hide only status bar:
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // to hide both:
    // SystemChrome.setEnabledSystemUIOverlays([]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(top: 0),
              child: Image.asset("assets/images/logo_mini.png"),
            ),
            Container(
              margin: EdgeInsets.only(
                top: height * 0.08,
                left: width * 0.05,
              ),
              alignment: Alignment.centerLeft,
              child: TitleText("Log in"),
            ),
            Container(
              width: width * 0.9,
              margin: EdgeInsets.only(
                top: height * 0.04,
              ),
              child: CustomizedInput(
                _email,
                "Email",
                "Put your email address",
                Icon(Icons.person),
                obscurcir: false,
              ),
            ),
            Container(
              width: width * 0.9,
              margin: EdgeInsets.only(
                top: height * 0.025,
              ),
              child: CustomizedInput(
                _password,
                "Password",
                "Your password goes here",
                GestureDetector(
                  child: _eye,
                  onTap: () {
                    setState(() {
                      obscurciInput = !obscurciInput;
                      _eye = (obscurciInput)
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.lock); //TODO: changer l'icone
                    });
                  },
                ),
                obscurcir: obscurciInput,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: height * 0.04,
              ),
              width: (!_validated) ? 50 : width * 0.9,
              height: height * 0.08,
              child: (_validated)
                  ? CustomizedButton(
                      "LOGIN",
                      login,
                    )
                  : CircularProgressIndicator(),
            )
          ],
        ),
      ),
    ));
  }
}
