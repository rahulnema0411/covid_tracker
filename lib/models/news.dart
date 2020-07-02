class News {
  String imageURL;
  String title;
  String description;
  String source;
  String linkToBrowser;
  News(
      {this.title,
      this.description,
      this.imageURL,
      this.source,
      this.linkToBrowser});
}

//Future<void> getNews() async{
//  _newsResponse = await
//  http.get('http://newsapi.org/v2/everything?q=apple&from=2020-07-01&to=2'
//      '020-07-01&sortBy=popularity&apiKey=3a30d0b107184294a6b3a81c06ee8a3d');
//  print('Got News');
//}
