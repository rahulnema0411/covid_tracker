import 'package:covidtracker/constants.dart';
import 'package:covidtracker/models/news.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final News _news;
  final Function onPress;

  NewsCard(this._news, this.onPress);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          color: cardColor_dark,
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(_news.imageURL),
                      fit: BoxFit.fitWidth),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    _news.title,
                    style: cardHeading_textStyle.copyWith(fontSize: 20.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    _news.description,
                    style: cardData_textStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    _news.source,
                    style: cardData_textStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
