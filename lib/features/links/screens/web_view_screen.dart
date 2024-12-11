import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late InAppWebViewController _webViewController;
  late InAppWebView _webView;

  @override
  void initState() {
    super.initState();
    // Initialize the webview.
    _webView = InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse('https://www.example.com')), // Set your URL here
      onWebViewCreated: (InAppWebViewController controller) {
        _webViewController = controller;
      },
      onLoadStart: (InAppWebViewController controller, Uri? url) {
        print("Page started loading: $url");
      },
      onLoadStop: (InAppWebViewController controller, Uri? url) {
        print("Page finished loading: $url");
      },
      onProgressChanged: (InAppWebViewController controller, int progress) {
        print("Page loading progress: $progress%");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView', style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
      ),
      body: _webView,
    );
  }
}
