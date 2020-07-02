import 'package:covidtracker/models/news.dart';
import 'package:flutter/material.dart';

class NewsScreenSwitch extends StatefulWidget {
  @override
  _NewsScreenSwitchState createState() => _NewsScreenSwitchState();
}

class _NewsScreenSwitchState extends State<NewsScreenSwitch> {

  bool isLoading;
  News news;

  Future<void> getData() async{
    news = News();
    await news.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
