// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String email;
  String password;
  String role;
  int id;
  String nama;

  UserModel({
    required this.email,
    required this.password,
    required this.role,
    required this.id,
    required this.nama,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        role: json["role"],
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "role": role,
        "id": id,
        "nama": nama,
      };
}
