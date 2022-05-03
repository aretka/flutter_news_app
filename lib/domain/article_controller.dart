
import 'package:news_demo_app/locator.dart';
import 'package:news_demo_app/network/repository.dart';

import 'models/articles_model.dart';

class ArticleController {
  Future<List<Article>> getArticles() async {
    return locator.get<Repository>().getArticles();
  }
}