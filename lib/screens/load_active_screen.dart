import 'package:covidtracker/models/location_service.dart';
import 'package:covidtracker/models/statistics.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'active_screen.dart';
import 'loading_shimmer_screen.dart';

//TODO : Implement Shimmer
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
    return Scaffold(
      body: SafeArea(
        child: LoadingShimmerScreen(),
      ),
    );
  }
}
