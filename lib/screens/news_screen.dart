import 'package:covidtracker/models/news.dart';
import 'package:covidtracker/constants.dart';
import 'package:covidtracker/widgets/news_web_view.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/models/news_list.dart';

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
      NewsWebView('url', onClosePress),
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
      _widgetList[1] = NewsWebView(url, onClosePress);
      _selectedWidget = 1;
      print('Tap Detected');
    });
  }

  void onClosePress() {
    setState(() {
      _selectedWidget = 0;
    });
  }
}
