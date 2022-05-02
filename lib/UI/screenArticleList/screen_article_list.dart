import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_demo_app/UI/screenArticleList/article_view.dart';
import 'package:news_demo_app/models/articles_model.dart';
import 'package:news_demo_app/network/repository.dart';

import '../../network/repository_impl.dart';

class ScreenArticleList extends StatefulWidget {
  const ScreenArticleList({Key? key}) : super(key: key);

  @override
  State<ScreenArticleList> createState() => _ScreenArticleListState();
}

class _ScreenArticleListState extends State<ScreenArticleList> {
  late Future<List<Article>> _articles;

  // This should be constructed injected with DI tool
  final Repository repository = RepositoryImpl();

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('News'),
            Text('API', style: TextStyle(color: Colors.blue))
          ],
        ),
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getArticles();
        },
        child: FutureBuilder<List<Article>>(
          future: _articles,
          builder: (context, snapshot) {
            Widget data;
            if (snapshot.hasError) {
              Fluttertoast.showToast(msg: Message.ERROR_MESSAGE);
              data = Center(
                  child: Text(snapshot.error.toString(),
                      textAlign: TextAlign.center));
            } else if (snapshot.hasData) {
              Fluttertoast.showToast(msg: Message.SUCCESS_MESSAGE);
              final articleList = snapshot.data;
              data = articleList == null
                  ? const Center(child: Text('Received data is null'))
                  : ListView.builder(
                      itemCount: articleList.length,
                      itemBuilder: (context, i) {
                        return ArticleView(article: articleList[i]);
                      });
            } else {
              data = const Center(child: CircularProgressIndicator());
            }
            return data;
          },
        ),
      ),
    );
  }

  void getArticles() async {
    setState(() {
      _articles = repository.getArticles();
    });
  }
}

class Message {
  static const SUCCESS_MESSAGE = "Successfully fetched data";
  static const ERROR_MESSAGE = "Failed to fetch data";
}
