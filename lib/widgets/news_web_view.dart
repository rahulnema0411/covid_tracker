import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants.dart';

class NewsWebView extends StatefulWidget {
  final String url;
  final Function onPress;

  NewsWebView(this.url, this.onPress);

  @override
  _NewsWebViewState createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.url,
          style: cardData_textStyle,
        ),
        leading: FlatButton(
          onPressed: () {
            setState(() {
              widget.onPress();
            });
          },
          child: Icon(Icons.close),
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.url,
      ),
    );
  }
}
