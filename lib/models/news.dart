import 'package:http/http.dart' as http;

class News {
  http.Response _newsResponse;

  News();

  Future<void> getNews() async{
    _newsResponse = await
    http.get('http://newsapi.org/v2/everything?q=apple&from=2020-07-01&to=2'
        '020-07-01&sortBy=popularity&apiKey=3a30d0b107184294a6b3a81c06ee8a3d');
    print('Got News');
  }
}
