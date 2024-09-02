import 'package:flutter/material.dart';
import 'package:newnewsapp/style/app_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  final String url;

  const NewsWebView({required this.url, Key? key}) : super(key: key);

  @override
  _NewsWebViewState createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  late final WebViewController controller;
  bool isLoading = true; // حالة تتبع التحميل

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Full Article'),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppbarColor.appbarColor),
              ),
            ),
        ],
      ),
    );
  }
}
