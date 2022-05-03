import 'package:flutter/material.dart';
import 'package:news_demo_app/UI/screenArticleList/screen_article_list.dart';

import 'UI/themes/app_themes.dart';
import 'locator.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo App',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.mainAppTheme,
        home: ScreenArticleList());
  }
}
