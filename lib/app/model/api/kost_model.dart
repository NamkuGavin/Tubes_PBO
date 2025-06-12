// To parse this JSON data, do
//
//     final kostModel = kostModelFromJson(jsonString);

import 'dart:convert';

KostModel kostModelFromJson(String str) => KostModel.fromJson(json.decode(str));

String kostModelToJson(KostModel data) => json.encode(data.toJson());

class KostModel {
  List<DataKost> dataKos;

  KostModel({
    required this.dataKos,
  });

  factory KostModel.fromJson(Map<String, dynamic> json) => KostModel(
        dataKos: List<DataKost>.from(json["dataKos"].map((x) => DataKost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dataKos": List<dynamic>.from(dataKos.map((x) => x.toJson())),
      };
}

class DataKost {
  int id;
  String namaKos;
  String alamat;
  int jumlahKamar;
  String deskripsi;
  String tipeKos;
  int harga;
  List<DataKamar> dataKamar;

  DataKost({
    required this.id,
    required this.namaKos,
    required this.alamat,
    required this.jumlahKamar,
    required this.deskripsi,
    required this.tipeKos,
    required this.harga,
    required this.dataKamar,
  });

  factory DataKost.fromJson(Map<String, dynamic> json) => DataKost(
        id: json["id"],
        namaKos: json["namaKos"],
        alamat: json["alamat"],
        jumlahKamar: json["jumlahKamar"],
        deskripsi: json["deskripsi"],
        tipeKos: json["tipeKos"],
        harga: json["harga"],
        dataKamar: List<DataKamar>.from(json["dataKamar"].map((x) => DataKamar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaKos": namaKos,
        "alamat": alamat,
        "jumlahKamar": jumlahKamar,
        "deskripsi": deskripsi,
        "tipeKos": tipeKos,
        "harga": harga,
        "dataKamar": List<dynamic>.from(dataKamar.map((x) => x.toJson())),
      };
}

class DataKamar {
  int noKamar;
  String status;
  DataPenghuni dataPenghuni;

  DataKamar({
    required this.noKamar,
    required this.status,
    required this.dataPenghuni,
  });

  factory DataKamar.fromJson(Map<String, dynamic> json) => DataKamar(
        noKamar: json["noKamar"],
        status: json["status"],
        dataPenghuni: DataPenghuni.fromJson(json["dataPenghuni"]),
      );

  Map<String, dynamic> toJson() => {
        "noKamar": noKamar,
        "status": status,
        "dataPenghuni": dataPenghuni.toJson(),
      };
}

class DataPenghuni {
  int? usia;
  String? nama;
  String? pekerjaan;
  String? jenisKendaraan;
  int? id;
  String? platKendaraan;
  String? nomorHp;
  String? kontakDarurat;

  DataPenghuni({
    this.usia,
    this.nama,
    this.pekerjaan,
    this.jenisKendaraan,
    this.id,
    this.platKendaraan,
    this.nomorHp,
    this.kontakDarurat,
  });

  factory DataPenghuni.fromJson(Map<String, dynamic> json) => DataPenghuni(
        usia: json["usia"],
        nama: json["nama"],
        pekerjaan: json["pekerjaan"],
        jenisKendaraan: json["jenisKendaraan"],
        id: json["id"],
        platKendaraan: json["platKendaraan"],
        nomorHp: json["nomorHp"],
        kontakDarurat: json["kontakDarurat"],
      );

  Map<String, dynamic> toJson() => {
        "usia": usia,
        "nama": nama,
        "pekerjaan": pekerjaan,
        "jenisKendaraan": jenisKendaraan,
        "id": id,
        "platKendaraan": platKendaraan,
        "nomorHp": nomorHp,
        "kontakDarurat": kontakDarurat,
      };
}
