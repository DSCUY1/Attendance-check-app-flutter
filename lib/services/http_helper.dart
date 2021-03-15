import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_decanat/models/room.dart';
import 'package:projet_decanat/models/supervisor.dart';
import 'package:projet_decanat/models/time_range.dart';
import 'package:projet_decanat/services/parameter.dart';

class HttpHelper {
  static String host = "http://192.168.225.201:8000/";
  // static String host = "https://attendceappuy1.herokuapp.com/";
  static String loginUrl = 'api/users/signin';
  static String currentUsrUrl = "api/users/currentuser";
  static String checkSupervisorUrl = "api/surveillance/checksupervisor";
  static String markSupervisorUrl = "api/surveillance/marksupervisor";
  static String logoutUrl = "api/users/signout";
  static String getSurveillantsUrl = "api/surveillance/supervisor";
  static String getRoomsUrl = "api/surveillance/room";
  static String getTimeRangesUrl = "api/surveillance/horaire";
  // static String cookie = "";

  static Future<Map<String, String>> logIn(String email, String pwd) async {
    Map<String, String> response = Map<String, String>();
    response["statut"] = "";
    try {
      String url = host + loginUrl;
      print("url: $url");
      final Map<String, dynamic> body = {'email': email, 'password': pwd};
      print("body: $body");
      final result = await http.post(url, body: body);
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        print("le statut est egale a 200");
        response["statut"] = "OK";
        print(result.headers['set-cookie']);
        Parameter.cookie = result.headers['set-cookie'];
        // print(Parameter.cookie);
      } else {
        print("status different de 200");
        response["response"] = "erreur ${result.statusCode}";
      }
    } catch (e) {
      print("exception lors du login");
      print(e);
      response["response"] = e.toString();
    }
    return response;
  }

  static Future<Map<String, String>> logOut() async {
    Map<String, String> response = Map<String, String>();
    response["statut"] = "";
    try {
      String url = host + logoutUrl;
      print("url: $url");
      final result =
          await http.post(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        print("le statut est egale a 200");
        response["statut"] = "OK";
        Parameter.welcome = false;
      } else {
        print("status different de 200");
        response["response"] = "erreur ${result.statusCode}";
      }
    } catch (e) {
      print("exception lors du logout");
      print(e);
      response["response"] = e.toString();
    }
    return response;
  }

  static Future<Map<String, String>> currentUser() async {
    Map<String, String> response = Map<String, String>();
    response["statut"] = "";
    try {
      String url = host + currentUsrUrl;
      print("url: $url");
      final result = await http.get(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        // print(result.body);
        print("le statut est egale a 200");
        Map<String, dynamic> jsonMap = jsonDecode(result.body);
        response['statut'] = "OK";
        response['response'] = "${jsonMap["data"]["role"]["id"]}";
        print(jsonMap["data"]["role"]["id"]);
        Parameter.first_name = jsonMap["data"]["first_name"];
        Parameter.last_name = jsonMap["data"]["last_name"];
        Parameter.email = jsonMap["data"]["email"];
        Parameter.matricule = jsonMap["data"]["matricule"];
        Parameter.phone = jsonMap["data"]["phone"];
      } else {
        print("status different de 200");
        response["response"] = "erreur ${result.statusCode}";
      }
    } catch (e) {
      print("exception lors current user");
      print(e);
      response["response"] = e.toString();
    }
    return response;
  }

  static Future<Map<String, dynamic>> checkSupervisor(String code) async {
    Map<String, dynamic> response = Map<String, dynamic>();
    response["statut"] = "";
    try {
      String url = host + checkSupervisorUrl + "/" + code;
      print("url: $url");
      final result = await http.get(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        print("le statut est egale a 200");
        Map<String, dynamic> jsonMap = jsonDecode(result.body);
        if (result.body == '{"message":"Utilisateur invalide"}') {
          response["response"] = jsonMap["message"];
        } else {
          if (result.body ==
              '{"message":"surveillant ne doit pas surveiller"}') {
            response["response"] = jsonMap["message"];
          } else {
            response["statut"] = "OK";
            response["supervisor"] = jsonMap["surv"]["name"];
            response["code"] = "${jsonMap["surv"]["id"]}";
            response["date"] = "ce jour";
            response["room"] = jsonMap["salle"]["code"];
            response["timerange"] =
                jsonMap["Horaire"]["begin"] + " - " + jsonMap["Horaire"]["end"];
          }
        }
      } else {
        if (404 == result.statusCode) {
          response["response"] = "Code invalide";
        } else {
          print("status different de 200");
          response["response"] = "Erreur reseau ${result.statusCode}";
        }
      }
    } catch (e) {
      print("exception lors check supervisor");
      print(e);
      response["response"] = "Unknow error";
      // response = e.toString();
    }
    return response;
  }

  static Future<Map<String, String>> markSupervisor(String code) async {
    Map<String, String> response = Map<String, String>();
    response["statut"] = "";
    try {
      String url = host + markSupervisorUrl + "/" + code;
      print("url: $url");
      final result = await http.get(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        print("le statut est egale a 200");
        response["statut"] = "OK";
      } else {
        print("status different de 200");
        response["response"] = "erreur ${result.statusCode}";
      }
    } catch (e) {
      print("exception lors du marksupervisor");
      print(e);
      response["response"] = e.toString();
    }
    return response;
  }

  static Future<Map<String, String>> getSurveillants() async {
    Map<String, String> response = Map<String, String>();
    try {
      String url = host + getSurveillantsUrl;
      print("url: $url");
      final result = await http.get(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        // print(result.body);
        print("le statut est egale a 200");
        Map<String, dynamic> jsonMap = jsonDecode(result.body);
        print(" jsonMap: $jsonMap");
        response['statut'] = "OK";
        final supervisorList = jsonMap['data'];
        print("supervisorList: $supervisorList");
        // Parameter.supervisors =
        //     supervisorList.map((i) => Supervisor.fromJson(i)).toList();
        for (var sup in supervisorList) {
          Parameter.supervisors.add(Supervisor.fromJson(sup));
        }
      } else {
        print("status different de 200");
        response["response"] = "Erreur ${result.statusCode}";
      }
    } catch (e) {
      print("exception lors du getSurveillants");
      print(e);
      response["response"] = e.toString();
    }
    return response;
  }

  static Future<Map<String, String>> getRooms() async {
    Map<String, String> response = Map<String, String>();
    try {
      String url = host + getRoomsUrl;
      print("url: $url");
      final result = await http.get(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        // print(result.body);
        print("le statut est egale a 200");
        Map<String, dynamic> jsonMap = jsonDecode(result.body);
        print(" jsonMap: $jsonMap");
        response['statut'] = "OK";
        final roomList = jsonMap['data'];
        print("roomList: $roomList");
        // Parameter.supervisors =
        //     supervisorList.map((i) => Supervisor.fromJson(i)).toList();
        for (var room in roomList) {
          Parameter.rooms.add(Room.fromJson(room));
        }
      } else {
        print("status different de 200");
        response["response"] = "Erreur ${result.statusCode}";
      }
    } catch (e) {
      print("exception lors du getRooms");
      print(e);
      response["response"] = e.toString();
    }
    return response;
  }

  static Future<Map<String, String>> getTimeRanges() async {
    Map<String, String> response = Map<String, String>();
    try {
      String url = host + getTimeRangesUrl;
      print("url: $url");
      final result = await http.get(url, headers: {"cookie": Parameter.cookie});
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        // print(result.body);
        print("le statut est egale a 200");
        Map<String, dynamic> jsonMap = jsonDecode(result.body);
        print(" jsonMap: $jsonMap");
        response['statut'] = "OK";
        final timeRangeList = jsonMap['data'];
        print("timeRangeList: $timeRangeList");
        // Parameter.supervisors =
        //     supervisorList.map((i) => Supervisor.fromJson(i)).toList();
        for (var tr in timeRangeList) {
          Parameter.timeRanges.add(TimeRange.fromJson(tr));
        }
      } else {
        print("status different de 200");
        response["response"] = "Erreur ${result.statusCode}";
      }
    } catch (e) {
      print("exception lors du getTimeRange");
      print(e);
      response["response"] = e.toString();
    }
    return response;
  }
}
