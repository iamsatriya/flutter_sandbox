import 'package:flutter/material.dart';
import 'package:flutter_sandbox/article.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:flutter_sandbox/article_webview.dart';

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
class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_web';
  final String url;

  const ArticleWebView({Key key, @required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}