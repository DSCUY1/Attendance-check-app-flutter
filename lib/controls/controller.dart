import 'package:projet_decanat/services/parameter.dart';

class Controller {
  static Map<String, dynamic> manuallyCheck(
      int supervisorId, int roomId, int tmID) {
    Map<String, dynamic> result = Map<String, dynamic>();
    result["statut"] = "";
    bool isSupervisor = false;
    for (var sup in Parameter.supervisors) {
      if (sup.id == supervisorId) {
        isSupervisor = true;
        bool roomTmOk = false;
        for (var surveillance in sup.exam["absent"]) {
          if (surveillance["salle"]["id"] == roomId &&
              surveillance["Horaire"]["id"] == tmID) {
            roomTmOk = true;
            result["statut"] = "OK";
            result["sup"] = sup.first_name + " " + sup.last_name;
            result["code"] = sup.id;
            result["date"] = "to day";
            result["room"] = surveillance["salle"]["code"];
            result["tm"] = surveillance["Horaire"]["begin"] +
                "-" +
                surveillance["Horaire"]["end"];
            break;
          }
        }
        if (!roomTmOk) {
          result["response"] =
              "Ce surveillant ne survielle pas cette salle a cette heure ou a deja ete controle";
        }
        break;
      }
    }
    if (!isSupervisor) {
      result["response"] = "Unknow Supervisor";
    }
    return result;
  }
}
