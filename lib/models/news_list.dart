import 'package:covidtracker/models/news.dart';
import 'package:covidtracker/widgets/news_card.dart';

class NewsList {
  final List<News> _newsList;

  NewsList(this._newsList);

  List<NewsCard> getNewsList(Function function) {
    List<NewsCard> list = [];
    for (int i = 0; i < _newsList.length; i++) {
      NewsCard newsCard = NewsCard(_newsList[i], () {
        function(_newsList[i].linkToBrowser);
      });
      list.add(newsCard);
    }
    return list;
  }
}
