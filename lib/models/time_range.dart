class TimeRange {
  int id;
  String begin;
  String end;

  TimeRange(this.id, this.begin, this.end);

  TimeRange.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson["id"];
    this.begin = parsedJson["begin"];
    this.end = parsedJson["end"];
  }
}
