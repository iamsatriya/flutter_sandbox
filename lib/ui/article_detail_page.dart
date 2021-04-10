import 'package:flutter/material.dart';
import 'file:///E:/Dicoding/Flutter_Fundamental/flutter_sandbox/lib/data/model/article.dart';

import 'article_webview.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';
  final Article article;

  const ArticleDetailPage({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Column(
            children: [
              Image.network(article.urlToImage),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.description),
                    Divider(color: Colors.grey),
                    Text(
                      article.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Divider(color: Colors.grey),
                    Text('Date: ${article.publishedAt}'),
                    SizedBox(height: 10),
                    Text('Author: ${article.author}'),
                    Divider(color: Colors.grey),
                    Text(
                      article.content,
                      style: TextStyle(fontSize: 1),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ArticleWebView.routeName,
                          arguments: article.url,
                        );
                      },
                      child: Text('Read More...'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

