// To parse this JSON data, do
//
//     final penghuniModel = penghuniModelFromJson(jsonString);

import 'dart:convert';

PenghuniModel penghuniModelFromJson(String str) => PenghuniModel.fromJson(json.decode(str));

String penghuniModelToJson(PenghuniModel data) => json.encode(data.toJson());

class PenghuniModel {
  DataPenghuni dataPenghuni;

  PenghuniModel({
    required this.dataPenghuni,
  });

  factory PenghuniModel.fromJson(Map<String, dynamic> json) => PenghuniModel(
        dataPenghuni: DataPenghuni.fromJson(json["dataPenghuni"]),
      );

  Map<String, dynamic> toJson() => {
        "dataPenghuni": dataPenghuni.toJson(),
      };
}

class DataPenghuni {
  int id;
  String nama;
  String jenisKelamin;
  int usia;
  String nomorHp;
  String pekerjaan;
  String kontakDarurat;
  String jenisKendaraan;
  String platKendaraan;
  List<RiwayatPembayaran> riwayatPembayaran;
  List<DataTransaksi> dataTransaksi;

  DataPenghuni({
    required this.id,
    required this.nama,
    required this.jenisKelamin,
    required this.usia,
    required this.nomorHp,
    required this.pekerjaan,
    required this.kontakDarurat,
    required this.jenisKendaraan,
    required this.platKendaraan,
    required this.riwayatPembayaran,
    required this.dataTransaksi,
  });

  factory DataPenghuni.fromJson(Map<String, dynamic> json) => DataPenghuni(
        id: json["id"],
        nama: json["nama"],
        jenisKelamin: json["jenisKelamin"],
        usia: json["usia"],
        nomorHp: json["nomorHp"],
        pekerjaan: json["pekerjaan"],
        kontakDarurat: json["kontakDarurat"],
        jenisKendaraan: json["jenisKendaraan"],
        platKendaraan: json["platKendaraan"],
        riwayatPembayaran: List<RiwayatPembayaran>.from(json["riwayatPembayaran"].map((x) => RiwayatPembayaran.fromJson(x))),
        dataTransaksi: List<DataTransaksi>.from(json["dataTransaksi"].map((x) => DataTransaksi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "jenisKelamin": jenisKelamin,
        "usia": usia,
        "nomorHp": nomorHp,
        "pekerjaan": pekerjaan,
        "kontakDarurat": kontakDarurat,
        "jenisKendaraan": jenisKendaraan,
        "platKendaraan": platKendaraan,
        "riwayatPembayaran": List<dynamic>.from(riwayatPembayaran.map((x) => x.toJson())),
        "dataTransaksi": List<dynamic>.from(dataTransaksi.map((x) => x.toJson())),
      };
}

class DataTransaksi {
  int nominal;
  String tanggalPembayaran;

  DataTransaksi({
    required this.nominal,
    required this.tanggalPembayaran,
  });

  factory DataTransaksi.fromJson(Map<String, dynamic> json) => DataTransaksi(
        nominal: json["nominal"],
        tanggalPembayaran: json["tanggalPembayaran"],
      );

  Map<String, dynamic> toJson() => {
        "nominal": nominal,
        "tanggalPembayaran": tanggalPembayaran,
      };
}

class RiwayatPembayaran {
  int id;
  String tanggalAwal;
  String tanggalAkhir;
  int nominalPembayaran;
  String status;

  RiwayatPembayaran({
    required this.id,
    required this.tanggalAwal,
    required this.tanggalAkhir,
    required this.nominalPembayaran,
    required this.status,
  });

  factory RiwayatPembayaran.fromJson(Map<String, dynamic> json) => RiwayatPembayaran(
        id: json["id"],
        tanggalAwal: json["tanggalAwal"],
        tanggalAkhir: json["tanggalAkhir"],
        nominalPembayaran: json["nominalPembayaran"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggalAwal": tanggalAwal,
        "tanggalAkhir": tanggalAkhir,
        "nominalPembayaran": nominalPembayaran,
        "status": status,
      };
}
