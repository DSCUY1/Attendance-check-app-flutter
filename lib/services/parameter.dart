import 'package:projet_decanat/models/room.dart';
import 'package:projet_decanat/models/supervisor.dart';
import 'package:projet_decanat/models/time_range.dart';

class Parameter {
  static String cookie = "";
  static String first_name = "";
  static String last_name = "";
  static String email = "";
  static String phone = "";
  static String matricule = "";
  static bool welcome = false;
  static List<Supervisor> supervisors = List<Supervisor>();
  static List<Room> rooms = List<Room>();
  static List<TimeRange> timeRanges = List<TimeRange>();
}
