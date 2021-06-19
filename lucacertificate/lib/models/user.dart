// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.certificates,
    this.id,
    this.firstName,
    this.lastName,
    this.tokenBase64,
    this.rNumber,
    this.v,
  });

  List<String> certificates;
  String id;
  String firstName;
  String lastName;
  String tokenBase64;
  String rNumber;
  int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        certificates: List<String>.from(json["certificates"].map((x) => x)),
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        tokenBase64: json["tokenBase64"],
        rNumber: json["rNumber"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "certificates": List<dynamic>.from(certificates.map((x) => x)),
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "tokenBase64": tokenBase64,
        "rNumber": rNumber,
        "__v": v,
      };
}
