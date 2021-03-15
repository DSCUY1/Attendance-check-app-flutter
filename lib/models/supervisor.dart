class Supervisor {
  int id;
  String first_name;
  String last_name;
  String genre;
  bool grade;
  String phone;
  String matricule;
  Map exam;

  Supervisor(this.id, this.first_name, this.last_name, this.genre, this.grade,
      this.phone, this.matricule, this.exam);

  Supervisor.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.first_name = parsedJson["first_name"];
    this.last_name = parsedJson["last_name"];
    this.genre = parsedJson["genre"];
    this.grade = parsedJson["grade"];
    this.phone = parsedJson["phone"];
    this.matricule = parsedJson["matricule"];
    this.exam = parsedJson["exam"];
  }
}
