import 'package:covidtracker/models/news.dart';
import 'package:covidtracker/models/statistics.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AppData extends ChangeNotifier {
  Statistics stats;
  List<Placemark> placemark;
  List<News> news;

  void setData(Statistics statistics, List<Placemark> placemark) {
    this.placemark = placemark;
    this.stats = statistics;
    notifyListeners();
  }

  void setNewsData(List<News> news) {
    this.news = news;
    notifyListeners();
  }
}
