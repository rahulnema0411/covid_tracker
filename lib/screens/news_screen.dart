import 'package:covidtracker/models/news.dart';
import 'package:covidtracker/widgets/news_tile.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final List<News> news;
  NewsScreen({this.news});
  @override
  Widget build(BuildContext context) {
    print(news.length);
    return ListView.builder(
      itemCount: news.length - 1,
      itemBuilder: (context, index) {
        print('news built$index');
        return NewsTile(
          news: news[index],
        );
      },
    );
  }
}
