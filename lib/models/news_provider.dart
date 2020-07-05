import 'dart:convert';
import 'package:covidtracker/constants.dart';
import 'package:covidtracker/models/news.dart';
import 'package:http/http.dart' as http;

class NewsProvider {
  String url =
      'http://newsapi.org/v2/everything?q=corona&sortBy=popularity&pageSize=10&apiKey=$kNewsAPIKey';

  Future<dynamic> getNewsData() async {
    var _newsData = await http.get(url);
    print('Got News');
    return jsonDecode(_newsData.body);
  }

  Future<List<News>> getNews() async {
    var data = await getNewsData();
    print('data received in getNews');
    print(data['totalResults']);
    List<News> news = [];
    for (var i in data['articles']) {
      news.add(
        News(
            title: i['title'],
            description: i['description'],
            linkToBrowser: i['url'],
            imageURL: i['urlToImage'],
            source: i['source']['name']),
      );
    }
    return news;
  }
}
