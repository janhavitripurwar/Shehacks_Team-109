// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.smart5Raw,
    this.smart187Raw,
    this.smart188Raw,
    this.smart197Raw,
    this.smart198Raw,
  });

  int smart5Raw;
  int smart187Raw;
  List<int> smart188Raw;
  List<int> smart197Raw;
  List<int> smart198Raw;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    smart5Raw: json["smart_5_raw"],
    smart187Raw: json["smart_187_raw"],
    smart188Raw: List<int>.from(json["smart_188_raw"].map((x) => x)),
    smart197Raw: List<int>.from(json["smart_197_raw"].map((x) => x)),
    smart198Raw: List<int>.from(json["smart_198_raw"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "smart_5_raw": smart5Raw,
    "smart_187_raw": smart187Raw,
    "smart_188_raw": List<dynamic>.from(smart188Raw.map((x) => x)),
    "smart_197_raw": List<dynamic>.from(smart197Raw.map((x) => x)),
    "smart_198_raw": List<dynamic>.from(smart198Raw.map((x) => x)),
  };
}
