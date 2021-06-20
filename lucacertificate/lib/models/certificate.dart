// To parse this JSON data, do
//
//     final certificate = certificateFromJson(jsonString);

import 'dart:convert';

List<Certificate> certificateFromJson(String str) => List<Certificate>.from(
    json.decode(str).map((x) => Certificate.fromJson(x)));

String certificateToJson(List<Certificate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Certificate {
  Certificate({
    this.id,
    this.machineKey,
    this.name,
    this.body,
    this.date,
    this.v,
  });

  String id;
  String machineKey;
  String name;
  String body;
  DateTime date;
  int v;

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
        id: json["_id"],
        machineKey: json["machineKey"],
        name: json["name"],
        body: json["body"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "machineKey": machineKey,
        "name": name,
        "body": body,
        "date": date.toIso8601String(),
        "__v": v,
      };
}
