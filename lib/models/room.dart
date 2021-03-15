class Room {
  int id;
  String code;
  String libelle;
  String localisation;

  Room(this.id, this.code, this.libelle, this.localisation);

  Room.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.code = parsedJson["code"];
    this.libelle = parsedJson["libelle"];
    this.localisation = parsedJson["localisation"];
  }
}
