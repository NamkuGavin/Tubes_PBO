// To parse this JSON data, do
//
//     final userPenghuniModel = userPenghuniModelFromJson(jsonString);

import 'dart:convert';

UserPenghuniModel userPenghuniModelFromJson(String str) => UserPenghuniModel.fromJson(json.decode(str));

String userPenghuniModelToJson(UserPenghuniModel data) => json.encode(data.toJson());

class UserPenghuniModel {
  String email;
  String password;
  String role;
  int id;
  String nama;
  int usia;
  String pekerjaan;
  String nomorHp;
  String kontakDarurat;
  String jenisKendaraan;
  String platKendaraan;
  String jenisKelamin;

  UserPenghuniModel({
    required this.email,
    required this.password,
    required this.role,
    required this.id,
    required this.nama,
    required this.usia,
    required this.pekerjaan,
    required this.nomorHp,
    required this.kontakDarurat,
    required this.jenisKendaraan,
    required this.platKendaraan,
    required this.jenisKelamin,
  });

  factory UserPenghuniModel.fromJson(Map<String, dynamic> json) => UserPenghuniModel(
        email: json["email"],
        password: json["password"],
        role: json["role"],
        id: json["id"],
        nama: json["nama"],
        usia: json["usia"],
        pekerjaan: json["pekerjaan"],
        nomorHp: json["nomorHp"],
        kontakDarurat: json["kontakDarurat"],
        jenisKendaraan: json["jenisKendaraan"],
        platKendaraan: json["platKendaraan"],
        jenisKelamin: json["jenisKelamin"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "role": role,
        "id": id,
        "nama": nama,
        "usia": usia,
        "pekerjaan": pekerjaan,
        "nomorHp": nomorHp,
        "kontakDarurat": kontakDarurat,
        "jenisKendaraan": jenisKendaraan,
        "platKendaraan": platKendaraan,
        "jenisKelamin": jenisKelamin,
      };
}
