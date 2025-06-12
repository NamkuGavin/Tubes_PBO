import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

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
}
