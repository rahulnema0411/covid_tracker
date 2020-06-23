import 'package:covidtracker/models/card_data_type.dart';
import 'package:covidtracker/widgets/chart_card.dart';
import 'package:covidtracker/widgets/data_card.dart';
import 'package:covidtracker/widgets/state_data_card.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/models/location_service.dart';
import 'file:///F:/AndroidStudioProjects/foundOnGit/covid_tracker/lib/models/statistics.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String state;
  String country;

  CardDataType cardDataState;
  CardDataType cardDataCountry;
  CardDataType cardDataGlobal;

  @override
  void initState() {
    super.initState();
    getLocation();
    getStats();
  }

  Future<void> getLocation() async {
    LocationService locationService = LocationService();
    await locationService.getLocation();
    await locationService.getAddress();
    this.state = locationService.city;
    this.country = locationService.country;
  }

  Future<void> getStats() async {
    Statistics stats = Statistics();
    cardDataCountry = await stats.getCountryStatistics(country);
    cardDataGlobal = await stats.getGlobalStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          StateDataCard(
            cardDataState: cardDataState,
          ),
          DataCard(
            cardData: cardDataCountry,
          ),
          DataCard(
            cardData: cardDataGlobal,
          ),
          ChartCard(),
        ],
      ),
    );
  }
}
