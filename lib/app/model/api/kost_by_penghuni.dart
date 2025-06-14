// To parse this JSON data, do
//
//     final kostbyPenghuniModel = kostbyPenghuniModelFromJson(jsonString);

import 'dart:convert';

KostbyPenghuniModel kostbyPenghuniModelFromJson(String str) => KostbyPenghuniModel.fromJson(json.decode(str));

String kostbyPenghuniModelToJson(KostbyPenghuniModel data) => json.encode(data.toJson());

class KostbyPenghuniModel {
  String message;
  int? id;
  String? namaKos;
  String? alamat;
  int? jumlahKamar;
  String? deskripsi;
  String? tipeKos;
  int? harga;
  DataKamar? dataKamar;
  List<RiwayatPembayaran>? riwayatPembayaran;
  List<DataTransaksi>? dataTransaksi;

  KostbyPenghuniModel({
    required this.message,
    this.id,
    this.namaKos,
    this.alamat,
    this.jumlahKamar,
    this.deskripsi,
    this.tipeKos,
    this.harga,
    this.dataKamar,
    this.riwayatPembayaran,
    this.dataTransaksi,
  });

  factory KostbyPenghuniModel.fromJson(Map<String, dynamic> json) => KostbyPenghuniModel(
        message: json["message"] ?? '',
        id: json["id"],
        namaKos: json["namaKos"],
        alamat: json["alamat"],
        jumlahKamar: json["jumlahKamar"],
        deskripsi: json["deskripsi"],
        tipeKos: json["tipeKos"],
        harga: json["harga"],
        dataKamar: json["dataKamar"] != null ? DataKamar.fromJson(json["dataKamar"]) : null,
        riwayatPembayaran: json["riwayatPembayaran"] != null ? List<RiwayatPembayaran>.from(json["riwayatPembayaran"].map((x) => RiwayatPembayaran.fromJson(x))) : null,
        dataTransaksi: json["dataTransaksi"] != null ? List<DataTransaksi>.from(json["dataTransaksi"].map((x) => DataTransaksi.fromJson(x))) : null,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": id,
        "namaKos": namaKos,
        "alamat": alamat,
        "jumlahKamar": jumlahKamar,
        "deskripsi": deskripsi,
        "tipeKos": tipeKos,
        "harga": harga,
        "dataKamar": dataKamar?.toJson(),
        "riwayatPembayaran": riwayatPembayaran?.map((x) => x.toJson()).toList(),
        "dataTransaksi": dataTransaksi?.map((x) => x.toJson()).toList(),
      };
}

class DataKamar {
  int id;
  int noKamar;
  String status;

  DataKamar({
    required this.id,
    required this.noKamar,
    required this.status,
  });

  factory DataKamar.fromJson(Map<String, dynamic> json) => DataKamar(
        id: json["id"],
        noKamar: json["noKamar"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "noKamar": noKamar,
        "status": status,
      };
}

class DataTransaksi {
  int nominal;
  DateTime tanggalPembayaran;

  DataTransaksi({
    required this.nominal,
    required this.tanggalPembayaran,
  });

  factory DataTransaksi.fromJson(Map<String, dynamic> json) => DataTransaksi(
        nominal: json["nominal"],
        tanggalPembayaran: DateTime.parse(json["tanggalPembayaran"]),
      );

  Map<String, dynamic> toJson() => {
        "nominal": nominal,
        "tanggalPembayaran":
            "${tanggalPembayaran.year.toString().padLeft(4, '0')}-${tanggalPembayaran.month.toString().padLeft(2, '0')}-${tanggalPembayaran.day.toString().padLeft(2, '0')}",
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
