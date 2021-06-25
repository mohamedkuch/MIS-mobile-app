// To parse this JSON data, do
//
//     final machine = machineFromJson(jsonString);

import 'dart:convert';

Machine machineFromJson(String str) => Machine.fromJson(json.decode(str));

String machineToJson(Machine data) => json.encode(data.toJson());

List<Machine> machineListFromJson(String str) =>
    List<Machine>.from(json.decode(str).map((x) => Machine.fromJson(x)));

class Machine {
  Machine({
    this.id,
    this.name,
    this.certificateKey,
    this.safetyCardUrl,
    this.v,
  });

  String id;
  String name;
  String certificateKey;
  String safetyCardUrl;
  int v;

  factory Machine.fromJson(Map<String, dynamic> json) => Machine(
        id: json["_id"],
        name: json["name"],
        certificateKey: json["certificateKey"],
        safetyCardUrl: json["safetyCardURL"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "certificateKey": certificateKey,
        "safetyCardURL": safetyCardUrl,
        "__v": v,
      };
}
