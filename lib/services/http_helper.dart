import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHelper {
  static String host = "http://192.168.225.201:8000/";
  static String loginUrl = 'api/users/signin';
  static String urlBase = '';
  static String urlUpcoming = '';
  static String urlLanguage = '';
  static String urlSearchBase = '';

  static Future<String> logIn(String email, String pwd) async {
    String response = "";
    try {
      final String url = host + loginUrl;
      print("url: $url");
      final Map<String, dynamic> body = {'email': email, 'password': pwd};
      print("body: $body");
      final result = await http.post(url, body: body);
      print("reponse: ${result.body}");
      if (200 == result.statusCode) {
        print("le statut est egale a 200");
        response = "OK";
      } else {
        print("erreur http lors de la recherche de l'info");
      }
    } catch (e) {
      print("exception lors du login");
      print(e);
      response = e.toString();
    }
    return response;
  }

  // Future<List> getUpcoming() async {
  //   final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
  //   http.Response result = await http.get(upcoming);
  //   // http.Response r = await http.post();
  //   if (result.statusCode == HttpStatus.ok) {
  //     final jsonResponse = json.decode(result.body);
  //     final moviesMap = jsonResponse['results'];
  //     // List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
  //     // return movies;
  //   } else {
  //     return null;
  //   }
  // }

  // Future<List> findMovies(String title) async {
  //   final String query = urlSearchBase + title;
  //   http.Response result = await http.get(query);
  //   if (result.statusCode == HttpStatus.ok) {
  //     final jsonResponse = json.decode(result.body);
  //     final moviesMap = jsonResponse['results'];
  //     // List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
  //     // return movies;
  //   } else {
  //     return null;
  //   }
  // }
}
