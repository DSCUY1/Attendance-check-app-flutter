import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_decanat/services/parameter.dart';

class HttpHelper {
  static String host = "http://192.168.43.11:8000/";
  // static String host = "https://attendceappuy1.herokuapp.com/";
  static String loginUrl = 'api/users/signin';
  static String currentUsrUrl = "api/users/currentuser";
  static String checkSupervisorUrl = "api/surveillance/checksupervisor";
  static String markSupervisorUrl = "api/surveillance/marksupervisor";
  static String logoutUrl = "api/users/signout";
  static String urlSearchBase = '';
  static String cookie = "";

  static Future<String> logIn(String email, String pwd) async {
    String response = "";
    response = "";
    try {
      String url = host + loginUrl;
      print("url: $url");
      final Map<String, dynamic> body = {'email': email, 'password': pwd};
      print("body: $body");
      final result = await http.post(url, body: body);
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        print("le statut est egale a 200");
        response = "OK";
        print(result.headers['set-cookie']);
        Parameter.cookie = result.headers['set-cookie'];
      } else {
        print("status different de 200");
      }
    } catch (e) {
      print("exception lors du login");
      print(e);
      response = e.toString();
    }
    return response;
  }

  static Future<String> logOut() async {
    String response = "";
    try {
      String url = host + logoutUrl;
      print("url: $url");
      final result =
          await http.post(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        print("le statut est egale a 200");
        response = "OK";
      } else {
        print("status different de 200");
      }
    } catch (e) {
      print("exception lors du logout");
      print(e);
      response = e.toString();
    }
    return response;
  }

  static Future<Map<String, String>> currentUser() async {
    Map<String, String> response = Map<String, String>();
    try {
      String url = host + currentUsrUrl;
      print("url: $url");
      final result = await http.get(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        print(result.body);
        print("le statut est egale a 200");
        Map<String, dynamic> jsonMap = jsonDecode(result.body);
        response['statut'] = "OK";
        response['response'] = "${jsonMap["data"]["role"]["id"]}";
        print(jsonMap["data"]["role"]["id"]);
      } else {
        print("status different de 200");
      }
    } catch (e) {
      print("exception lors current user");
      print(e);
      response["statut"] = e.toString();
    }
    return response;
  }

  static Future<Map<String, dynamic>> checkSupervisor(String code) async {
    Map<String, dynamic> response = Map<String, dynamic>();
    try {
      String url = host + checkSupervisorUrl + "/" + code;
      print("url: $url");
      final result = await http.get(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        print("le statut est egale a 200");
        Map<String, dynamic> jsonMap = jsonDecode(result.body);
        response["supervisor"] = jsonMap["surv"]["name"];
        response["code"] = "${jsonMap["surv"]["id"]}";
        response["date"] = "ce jour";
        response["room"] = jsonMap["salle"]["code"];
        response["timerange"] =
            jsonMap["Horaire"]["begin"] + " - " + jsonMap["Horaire"]["end"];
      } else {
        print("status different de 200");
      }
    } catch (e) {
      print("exception lors current user");
      print(e);
      // response = e.toString();
    }
    return response;
  }

  static Future<String> markSupervisor(String code) async {
    String response = "";
    try {
      String url = host + markSupervisorUrl + "/" + code;
      print("url: $url");
      final result = await http.get(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        print("le statut est egale a 200");
        response = "OK";
      } else {
        print("status different de 200");
      }
    } catch (e) {
      print("exception lors du marksupervisor");
      print(e);
      response = e.toString();
    }
    return response;
  }
}
