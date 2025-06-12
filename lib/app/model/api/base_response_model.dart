// To parse this JSON data, do
//
//     final addKostModel = addKostModelFromJson(jsonString);

import 'dart:convert';

BaseResponseModel addKostModelFromJson(String str) => BaseResponseModel.fromJson(json.decode(str));

String addKostModelToJson(BaseResponseModel data) => json.encode(data.toJson());

class BaseResponseModel {
  String message;

  BaseResponseModel({
    required this.message,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) => BaseResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
