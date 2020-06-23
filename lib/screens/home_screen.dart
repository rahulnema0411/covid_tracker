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
  }

  Future<void> getStats() async {
    Statistics stats = Statistics();
    await stats.getStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          StateDataCard(
            totalConfirmed: '10,395',
            totalRecovered: '7904',
            totalDeaths: '546',
            newConfirmed: '1500',
            newRecovered: '150',
            newDeaths: '20',
            activeRate: '23.48.',
            recoveryRate: '72.27',
            deathRate: '3.14',
          ),
          DataCard(
            totalConfirmed: '10,395',
            totalRecovered: '7904',
            totalDeaths: '546',
            newConfirmed: '1500',
            newRecovered: '150',
            newDeaths: '20',
          ),
          DataCard(
            totalConfirmed: '10,395',
            totalRecovered: '7904',
            totalDeaths: '546',
            newConfirmed: '1500',
            newRecovered: '150',
            newDeaths: '20',
          ),
          ChartCard(),
        ],
      ),
    );
  }
}
