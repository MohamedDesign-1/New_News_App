import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:newnewsapp/api/api_constatnts.dart';
import 'package:newnewsapp/models/SourceResponse.dart';
import 'package:newnewsapp/models/news_response.dart';

@injectable
class ApiManger {
  Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.sourceApi,
        {'apiKey': ApiConstatnts.apiKey, 'category': categoryId});
    try {
      print(url);
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.newsApi,
        {'apiKey': ApiConstatnts.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse?> getSearchNews(String searchText) async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.newsApi,
        {'q': searchText ,'apiKey': ApiConstatnts.apiKey});
    try {
      print(url);
      var response = await http.get(url);
      print('Error: ${response.body}');
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
