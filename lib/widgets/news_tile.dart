import 'package:covidtracker/constants.dart';
import 'package:covidtracker/models/news.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final News news;
  NewsTile({this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: cardColor_dark,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(8.0),
      height: 300.0,
      child: Column(
        children: <Widget>[
          Container(
            height: 220.0,
            width: double.infinity,
            child: news.imageURL != null
                ? Image.network(
                    news.imageURL,
                    fit: BoxFit.fill,
                  )
                : Text('Image not found'),
          ),
          Text(news.title),
        ],
      ),
    );
  }
}
