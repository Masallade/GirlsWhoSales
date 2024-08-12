import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:girlzwhosell/screens/intro_pages/sign_in_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewClass extends StatefulWidget {
  @override
  _WebViewClassState createState() => _WebViewClassState();
}

class _WebViewClassState extends State<WebViewClass> {

  // final Completer<WebViewController> _controller =
  // Completer<WebViewController>();

  WebViewController?  controller;

  bool isLoading = true;
  bool isLogin = false;
  // final url = 'https://biitsolutions.co.uk/girlzwhosell/employers/auth/login';
  final url = 'https://girlzwhosellcareerconextions.com/employers/auth/login';

  // WebViewController _webViewController;

  // String urlLogin = 'https://biitsolutions.co.uk/girlzwhosell/employers/dashboard';
  String urlLogin = 'https://girlzwhosellcareerconextions.com/employers/dashboard';

  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    //webview_flutter package 4.2.0
    // setState(() {
    //   controller = WebViewController()
    //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //     ..setBackgroundColor(const Color(0x00000000))
    //     ..setNavigationDelegate(
    //       NavigationDelegate(
    //         onProgress: (int progress) {
    //           // Update loading bar.
    //         },
    //         onPageStarted: (String url) {},
    //         onPageFinished: (String url) {
    //           checkCurrentPage(url);
    //         },
    //         onWebResourceError: (WebResourceError error) {
    //           print("Error Webpage loading...");
    //         },
    //         onNavigationRequest: (NavigationRequest request) {
    //           if (request.url.startsWith(url)) {//'https://www.youtube.com/'
    //             return NavigationDecision.prevent;
    //           }
    //           return NavigationDecision.navigate;
    //         },
    //       ),
    //     )
    //     ..loadRequest(Uri.parse(url));//'https://flutter.dev'
    // });

  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: Stack(
          children: [
            // WebViewWidget(
            //   controller: controller
            // // initialUrl: url,//old  webview package 3.0.1 to 3.0.4
            // //     onPageFinished: (String url) {
            // //       setState(() {
            // //         isLoading = false;
            // //         isLogin = false;
            // //       });
            // //       checkCurrentPage(url);
            // //     },
            // //
            // // javascriptMode: JavascriptMode.unrestricted,
            // // onWebViewCreated: (WebViewController webViewController) {
            // //   _controller.complete(webViewController);
            //  // return CircularProgressIndicator(color: Colors.pinkAccent[200],);
            // // },
            // ),
            
            InAppWebView(
              onWebViewCreated: (controller)=> webViewController = controller,

              onLoadStart: (controller,url){
                setState(() {
                  StartLoadPage(url.toString());
                });
              },
              onLoadStop: (controller,url){
                setState(() {
                  EndLoadPage(url.toString());
                });

              },

              initialUrlRequest: URLRequest(url: Uri.parse(url)),
            ),
            
            Visibility(
              visible: isLoading,
              child: const Center(
                child: CircularProgressIndicator(color:Colors.pinkAccent),
              ),
            ),
            Visibility(
              visible: !isLoading && !isLogin,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20), // Adjust the margin to position the button
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                    child: Text("Switch to Job Seeker",style: TextStyle(color: Colors.blueAccent),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void StartLoadPage(String url) {

    print('Case usr is $url');

    switch (url){
      // case "https://biitsolutions.co.uk/girlzwhosell/employers/dashboard":
      case "https://girlzwhosellcareerconextions.com/employers/dashboard":
        print("case dashboard start");
        setState(() {
          isLoading = true;
          isLogin = true;
        });
        break;
      // case "https://biitsolutions.co.uk/girlzwhosell/employers/auth/login":
      case "https://girlzwhosellcareerconextions.com/employers/auth/login":
        print("case logiin start");
        setState(() {
          isLoading = true;
          isLogin = false;
        });
        break;
    // dawood edit
      case "https://girlzwhosellcareerconextions.com/employers/job/listing":
        print("case dashboard start");
        setState(() {
          isLoading = true;
          isLogin = true;
        });
        break;
    // dawood edit/
      default:
        print("case default start");
        setState(() {
          isLoading = true;
        });
        break;
    }
  }

  void EndLoadPage(String url) {
    switch(url){
      // case "https://biitsolutions.co.uk/girlzwhosell/employers/auth/login":
      case "https://girlzwhosellcareerconextions.com/employers/auth/login":
        print("case login end");
        setState(() {
          isLoading = false;
          isLogin = false;
        });
        break;
        // dawood edit
      case "https://girlzwhosellcareerconextions.com/employers/job/listing":
        print("case dashboard start");
        setState(() {
          isLoading = true;
          isLogin = true;
        });
        break;
        // dawood edit/
      default:
        print("case default end");
        setState(() {
          isLoading = false;
          isLogin = true;
        });
        break;
    }
  }

  void openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? filePath = result.files.single.path;
      // Pass the filePath to the WebView or handle it as needed
    }
  }

  // void passFilePathToWebView(String filePath) async {
  //   // Escape the file path to be used as a JavaScript string
  //   String escapedFilePath = filePath.replaceAll("'", r"\'");
  //
  //   // Construct the JavaScript code to pass the file path to the WebView
  //   String javascriptCode = "handleFilePath('$escapedFilePath');";
  //
  //   // Execute the JavaScript code in the WebView
  //   if (_webViewController != null) {
  //     await _webViewController.evaluateJavascript(javascriptCode);
  //   } else {
  //     // WebView controller is not yet available
  //     // Handle this case accordingly
  //   }
  // }
}