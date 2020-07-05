import 'package:covidtracker/models/news.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/models/news_list.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  final List<News> news;

  NewsScreen({this.news});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsList _newsList;
  List<Widget> newsCards;
  List<Widget> _widgetList;
  int _selectedWidget = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newsList = NewsList(widget.news);
    _widgetList = [
      newsGlanceView(),
      newsWebView('url'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _widgetList[_selectedWidget];
  }

  Widget newsGlanceView() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AppBar(
            centerTitle: true,
            title: Text(
              'Updates',
              style: textStyle_dark.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 28.0,
              ),
            ),
          ),
          Column(
            children: _newsList.getNewsList(onCardPress),
          ),
        ],
      ),
    );
  }

  void onCardPress(String url) {
    setState(() {
      print(url);
      _widgetList[1] = newsWebView(url);
      _selectedWidget = 1;
      print('Tap Detected');
    });
  }

  Widget newsWebView(String url) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          url,
          style: cardData_textStyle,
        ),
        leading: FlatButton(
          onPressed: () {
            setState(() {
              _selectedWidget = 0;
            });
          },
          child: Icon(Icons.close),
        ),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }
}
