import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tubes_pbo/app/model/api/all_penghuni_model.dart';
import 'package:tubes_pbo/app/model/api/penghuni_model.dart';
import 'package:tubes_pbo/app/model/api/user_model.dart';

import '../../model/api/base_response_model.dart';
import '../../model/api/kost_model.dart';
import 'url_endpoint.dart';

class ApiService {
  Future<KostModel> getKostAll() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    print("URL KOST: ${UrlEndpoint.baseUrl}${UrlEndpoint.getKostAll}");
    final res = await http.get(Uri.parse("${UrlEndpoint.baseUrl}${UrlEndpoint.getKostAll}"), headers: headers);
    print("STATUS CODE(KOST): ${res.statusCode}");
    print("RES KOST: ${res.body}");
    if (res.statusCode == 200) {
      return KostModel.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<BaseResponseModel> createKost(
      {required String namaKos, required int jumlahKamar, required int harga, required String alamat, required String deskripsi, required String tipeKos}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final body = {"namaKos": namaKos, "jumlahKamar": jumlahKamar, "harga": harga, "alamat": alamat, "deskripsi": deskripsi, "tipeKos": tipeKos};
    print("RAW CREATE KOST: $body");
    print("URL CREATE KOST: ${UrlEndpoint.baseUrl}${UrlEndpoint.addKost}");
    final res = await http.post(Uri.parse(UrlEndpoint.baseUrl + UrlEndpoint.addKost), headers: headers, body: jsonEncode(body));
    print("STATUS CODE(CREATE KOST): ${res.statusCode}");
    print("RES CREATE KOST: ${res.body}");
    if (res.statusCode == 200) {
      return BaseResponseModel.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<List<AllPenghuniModel>> getPenghuniAll() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    print("URL PENGHUNI: ${UrlEndpoint.baseUrl}${UrlEndpoint.getPenghuniAll}");
    final res = await http.get(
      Uri.parse("${UrlEndpoint.baseUrl}${UrlEndpoint.getPenghuniAll}"),
      headers: headers,
    );
    print("STATUS CODE(PENGHUNI): ${res.statusCode}");
    print("RES PENGHUNI: ${res.body}");
    if (res.statusCode == 200) {
      final List<dynamic> data = jsonDecode(res.body);
      return data.map((e) => AllPenghuniModel.fromJson(e)).toList();
    } else {
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<BaseResponseModel> assignPenghuni({required String kosId, required String noKamar, required String penghuniId}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    print("URL ASSIGN PENGHUNI: ${UrlEndpoint.baseUrl}/kos/$kosId/$noKamar/penghuni/$penghuniId");
    final res = await http.post(Uri.parse("${UrlEndpoint.baseUrl}/kos/$kosId/$noKamar/penghuni/$penghuniId"), headers: headers);
    print("STATUS CODE(ASSIGN PENGHUNI): ${res.statusCode}");
    print("RES ASSIGN PENGHUNI: ${res.body}");
    if (res.statusCode == 200) {
      return BaseResponseModel.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<BaseResponseModel> editKost({required String idKos, required String namaKos, required int harga, required String deskripsi}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final body = {"namaKos": namaKos, "harga": harga, "deskripsi": deskripsi};
    print("RAW EDIT KOST: $body");
    print("URL EDIT KOST: ${UrlEndpoint.baseUrl}${UrlEndpoint.editKost}/$idKos");
    final res = await http.post(Uri.parse("${UrlEndpoint.baseUrl}${UrlEndpoint.editKost}/$idKos"), headers: headers, body: jsonEncode(body));
    print("STATUS CODE(EDIT KOST): ${res.statusCode}");
    print("RES EDIT KOST: ${res.body}");
    if (res.statusCode == 200) {
      return BaseResponseModel.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<BaseResponseModel> deleteKost({required String idKos}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    print("URL DELETE KOST: ${UrlEndpoint.baseUrl}${UrlEndpoint.deleteKost}/$idKos");
    final res = await http.delete(Uri.parse("${UrlEndpoint.baseUrl}${UrlEndpoint.deleteKost}/$idKos"), headers: headers);
    print("STATUS CODE(DELETE KOST): ${res.statusCode}");
    print("RES DELETE KOST: ${res.body}");
    if (res.statusCode == 200) {
      return BaseResponseModel.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<PenghuniModel> getPenghuniByKamar({required String kosId, required String noKamar}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    print("URL GET PENGHUNI BY KAMAR: ${UrlEndpoint.baseUrl}/kos/$kosId/$noKamar/penghuni");
    final res = await http.get(Uri.parse("${UrlEndpoint.baseUrl}/kos/$kosId/$noKamar/penghuni"), headers: headers);
    print("STATUS CODE(GET PENGHUNI BY KAMAR): ${res.statusCode}");
    print("RES GET PENGHUNI BY KAMAR: ${res.body}");
    if (res.statusCode == 200) {
      return PenghuniModel.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<BaseResponseModel> kosongKamar({required String kosId, required String noKamar}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    print("URL KOSONG KAMAR: ${UrlEndpoint.baseUrl}/kos/$kosId/$noKamar/kosong");
    final res = await http.post(Uri.parse("${UrlEndpoint.baseUrl}/kos/$kosId/$noKamar/kosong"), headers: headers);
    print("STATUS CODE(KOSONG KAMAR): ${res.statusCode}");
    print("RES KOSONG KAMAR: ${res.body}");
    if (res.statusCode == 200) {
      return BaseResponseModel.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<BaseResponseModel> registerPemilik({required String nama, required String email, required String password}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final body = {"nama": nama, "email": email, "password": password, "role": "pemilik"};
    print("RAW REGISTER PEMILIK: $body");
    print("URL REGISTER PEMILIK: ${UrlEndpoint.baseUrl}${UrlEndpoint.registerPemilik}");
    final res = await http.post(Uri.parse("${UrlEndpoint.baseUrl}${UrlEndpoint.registerPemilik}"), headers: headers, body: jsonEncode(body));
    print("STATUS CODE(REGISTER PEMILIK): ${res.statusCode}");
    print("RES REGISTER PEMILIK: ${res.body}");
    if (res.statusCode == 200) {
      return BaseResponseModel.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future<UserModel> getProfilePemilik({required String namaUser}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    print("URL PROFILE PEMILIK: ${UrlEndpoint.baseUrl}/pemilik/$namaUser");
    final res = await http.get(Uri.parse("${UrlEndpoint.baseUrl}/pemilik/$namaUser"), headers: headers);
    print("STATUS CODE(PROFILE PEMILIK): ${res.statusCode}");
    print("RES PROFILE PEMILIK: ${res.body}");
    if (res.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(res.body));
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }

  Future editProfilePemilik({required String pemilikId, required String nama}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final body = {"nama": nama};
    print("RAW EDIT KOST: $body");
    print("URL EDIT PROFILE PEMILIK: ${UrlEndpoint.baseUrl}/pemilik/$pemilikId");
    final res = await http.patch(Uri.parse("${UrlEndpoint.baseUrl}/pemilik/$pemilikId"), headers: headers, body: jsonEncode(body));
    print("STATUS CODE(EDIT PROFILE PEMILIK): ${res.statusCode}");
    print("RES EDIT PROFILE PEMILIK: ${res.body}");
    if (res.statusCode == 200) {
      return "Success";
    } else {
      print(res.statusCode);
      throw HttpException('request error code ${res.statusCode}');
    }
  }
}
