import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/SourceResponse/SourcesResponse.dart';

import '../model/newsResponse/NewsResponse.dart';

class ApiManager {
  static const baseUri = 'newsapi.org';
  static const apiKey = '33e7c40b7fc2406cbac5cc6eb2ea67ed';

  static Future<SourcesResponse> getSources(String categoryId) async {
    var uri = Uri.https(baseUri, 'v2/top-headlines/sources', {
      "apiKey": apiKey,
      "category": categoryId,
    });
    var response = await http.get(uri);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String? sourcesId) async {
    var url = Uri.https(baseUri, 'v2/everything', {
      "apiKey": apiKey,
      "sources": sourcesId,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
