import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_demo_app/network/repository.dart';

import '../domain/models/articles_model.dart';

class RepositoryImpl extends Repository {
  @override
  Future<List<Article>> getArticles() async {
    final Map<String, String> queryParams = {
      'country': 'us',
      'category': 'technology'
    };
    final headers = {HttpHeaders.authorizationHeader: _API_KEY};
    final uri = Uri.parse(_BASE_URL).replace(queryParameters: queryParams);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final articles = articlesFromJson(response.body);
      return articles.articles;
    } else {
      throw Exception('response status code: ${response.statusCode}');
    }
  }

  static const String _BASE_URL = "https://newsapi.org/v2/top-headlines";
  static const String _API_KEY = "53dbe05b0b9a4154a8f5b44b2e9201ec";
}
