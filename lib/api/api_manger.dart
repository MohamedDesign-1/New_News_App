import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newnewsapp/api/api_constatnts.dart';
import 'package:newnewsapp/models/SourceResponse.dart';

class ApiManger {
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstatnts.baseUrl , ApiConstatnts.sourceApi , {'apiKey' : ApiConstatnts.apiKey});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}

