import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewClass extends StatefulWidget {
  @override
  _WebViewClassState createState() => _WebViewClassState();
}

class _WebViewClassState extends State<WebViewClass> {

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  bool isLoading = true;
  final url = 'https://biitsolutions.co.uk/girlzwhosell/employers/auth/login';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: WebviewScaffold(
        //   hidden: true,
        //   url: 'https://biitsolutions.co.uk/girlzwhosell/employers/auth/login',
        //   withLocalStorage: true,
        //   clearCache: true,
        //   debuggingEnabled: true,
        //   appCacheEnabled: true,
        // ),
        body: Stack(
          children: [
            WebView(
            initialUrl: url,
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
             // return CircularProgressIndicator(color: Colors.pinkAccent[200],);
            }),
            Visibility(
              visible: isLoading,
              child: const Center(
                child: CircularProgressIndicator(color:Colors.pinkAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}