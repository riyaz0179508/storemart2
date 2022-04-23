import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

bool showSpinner = true;
final Completer<WebViewController> _controller = Completer<WebViewController>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: WebView(
          initialUrl:
              "https://www.storemartbd.com/",
          gestureRecognizers: Set()
            ..add(Factory<HorizontalDragGestureRecognizer>(
                () => HorizontalDragGestureRecognizer())),
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
            setState(() {
              showSpinner = false;
            });
          },
        ),
      ),
    ));
  }
}
