import 'package:get_it/get_it.dart';
import 'package:news_demo_app/domain/article_controller.dart';
import 'package:news_demo_app/network/repository.dart';
import 'package:news_demo_app/network/repository_impl.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<Repository>(() => RepositoryImpl());
  locator.registerLazySingleton<ArticleController>(() => ArticleController());
}