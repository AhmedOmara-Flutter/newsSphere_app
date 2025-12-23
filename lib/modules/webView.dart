import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  final String url;

  const WebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
