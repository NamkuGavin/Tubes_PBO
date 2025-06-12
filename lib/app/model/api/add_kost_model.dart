// To parse this JSON data, do
//
//     final addKostModel = addKostModelFromJson(jsonString);

import 'dart:convert';

AddKostModel addKostModelFromJson(String str) => AddKostModel.fromJson(json.decode(str));

String addKostModelToJson(AddKostModel data) => json.encode(data.toJson());

class AddKostModel {
  String message;

  AddKostModel({
    required this.message,
  });

  factory AddKostModel.fromJson(Map<String, dynamic> json) => AddKostModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
