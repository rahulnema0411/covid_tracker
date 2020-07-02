import 'package:covidtracker/models/app_data.dart';
import 'package:covidtracker/models/news.dart';
import 'package:covidtracker/models/news_provider.dart';
import 'package:covidtracker/screens/loading_shimmer_screen.dart';
import 'package:covidtracker/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreenSwitch extends StatefulWidget {
  @override
  _NewsScreenSwitchState createState() => _NewsScreenSwitchState();
}

class _NewsScreenSwitchState extends State<NewsScreenSwitch> {
  bool isLoading = true;
  List<News> newsList;

  Future<void> getData() async {
    NewsProvider newsProvider = NewsProvider();
    List<News> news = await newsProvider.getNews();
    context.read<AppData>().setNewsData(news);
    newsList = news;
    setState(() {
      isLoading = false;
    });
    print('Data received');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (context.read<AppData>().news == null) {
      isLoading = true;
      getData();
    } else {
      isLoading = false;
      newsList = context.read<AppData>().news;
    }
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? LoadingShimmerScreen()
          : NewsScreen(
              news: newsList,
            ),
    );
  }
}
