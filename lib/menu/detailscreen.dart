import 'package:flutter/material.dart';
import '../api/model/news.dart';
import 'package:webview_flutter/webview_flutter.dart';


class DetailScreen extends StatefulWidget {

  final News newsItem;

  const DetailScreen({super.key, required this.newsItem});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    setState(() {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // print('WebView is $progress% done');
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onHttpError: (HttpResponseError error) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse('https://flutter.dev'));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}