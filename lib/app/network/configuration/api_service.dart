import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tubes_pbo/app/model/api/penghuni_model.dart';

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

  Future<List<PenghuniModel>> getPenghuniAll() async {
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
      return data.map((e) => PenghuniModel.fromJson(e)).toList();
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
}
