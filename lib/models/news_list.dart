import 'package:covidtracker/models/news.dart';
import 'package:covidtracker/widgets/news_card.dart';

class NewsList {
  final List<News> _newsList;

  NewsList(this._newsList);

  List<NewsCard> getNewsList(Function function) {
    List<NewsCard> list = [];
    for (int i = 0; i < _newsList.length; i++) {
      if (!checkIsNull(_newsList[i])) {
        NewsCard newsCard = NewsCard(_newsList[i], () {
          function(_newsList[i].linkToBrowser);
        });
        list.add(newsCard);
      }
    }
    return list;
  }

  bool checkIsNull(News news) {
    bool flag = false;
    if (news.imageURL == null) flag = true;
    if (news.source == null) flag = true;
    if (news.title == null) flag = true;
    if (news.description == null) flag = true;
    if (news.linkToBrowser == null) flag = true;
    if (news.publishedAt == null) flag = true;
    return flag;
  }
}
