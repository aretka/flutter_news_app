import 'package:news_demo_app/models/articles_model.dart';

abstract class Repository {
  Future<List<Article>> getArticles();
}