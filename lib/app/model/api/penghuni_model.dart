// To parse this JSON data, do
//
//     final penghuniModel = penghuniModelFromJson(jsonString);

import 'dart:convert';

List<PenghuniModel> penghuniModelFromJson(String str) => List<PenghuniModel>.from(json.decode(str).map((x) => PenghuniModel.fromJson(x)));

String penghuniModelToJson(List<PenghuniModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PenghuniModel {
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
  Kamar kamar;

  PenghuniModel({
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
    required this.kamar,
  });

  factory PenghuniModel.fromJson(Map<String, dynamic> json) => PenghuniModel(
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
        kamar: json["kamar"] != null ? Kamar.fromJson(json["kamar"]) : Kamar.empty(),
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
        "kamar": kamar.toJson(),
      };
}

class Kamar {
  int id;
  int noKamar;
  String status;

  Kamar({
    required this.id,
    required this.noKamar,
    required this.status,
  });

  factory Kamar.fromJson(Map<String, dynamic> json) => Kamar(
        id: json["id"],
        noKamar: json["noKamar"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "noKamar": noKamar,
        "status": status,
      };

  factory Kamar.empty() => Kamar(
        id: 0,
        noKamar: 0,
        status: "kosong",
      );
}
