// To parse this JSON data, do
//
//     final workplace = workplaceFromJson(jsonString);

import 'dart:convert';

Workplace workplaceFromJson(String str) => Workplace.fromJson(json.decode(str));

String workplaceToJson(Workplace data) => json.encode(data.toJson());

List<Workplace> workplaceListFromJson(String str) =>
    List<Workplace>.from(json.decode(str).map((x) => Workplace.fromJson(x)));

class Workplace {
  Workplace({
    this.machines,
    this.id,
    this.name,
    this.workplaceNumber,
    this.v,
  });

  List<String> machines;
  String id;
  String name;
  String workplaceNumber;
  int v;

  factory Workplace.fromJson(Map<String, dynamic> json) => Workplace(
        machines: List<String>.from(json["machines"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        workplaceNumber: json["workplaceNumber"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "machines": List<dynamic>.from(machines.map((x) => x)),
        "_id": id,
        "name": name,
        "workplaceNumber": workplaceNumber,
        "__v": v,
      };
}
