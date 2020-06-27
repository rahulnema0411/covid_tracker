import 'package:covidtracker/models/card_data_type.dart';
import 'package:covidtracker/models/location_service.dart';
import 'package:covidtracker/models/statistics.dart';
import 'package:covidtracker/screens/active_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadActiveScreen extends StatefulWidget {
  @override
  _LoadActiveScreenState createState() => _LoadActiveScreenState();
}

class _LoadActiveScreenState extends State<LoadActiveScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    LocationService locationService = LocationService();
    Statistics stats = Statistics();
    await locationService.getLocation();
    List<Placemark> placemark = await locationService.getAddress();
    await stats.getStatistics();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActiveScreen(
          placemark: placemark,
          stats: stats,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Loading the goddamn data'),
    );
  }
}
