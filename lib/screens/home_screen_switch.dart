import 'package:covidtracker/models/app_data.dart';
import 'package:covidtracker/models/location_service.dart';
import 'package:covidtracker/models/statistics.dart';
import 'package:covidtracker/screens/home_screen.dart';
import 'package:covidtracker/screens/loading_shimmer_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class HomeScreenSwitch extends StatefulWidget {
  @override
  _HomeScreenSwitchState createState() => _HomeScreenSwitchState();
}

class _HomeScreenSwitchState extends State<HomeScreenSwitch> {
  bool isLoading;
  Statistics statistics;
  List<Placemark> location;

  Future<void> getData() async {
    LocationService locationService = LocationService();
    Statistics stats = Statistics();
    await locationService.getLocation();
    List<Placemark> placemark = await locationService.getAddress();
    await stats.getStatistics();

    context.read<AppData>().setData(stats, placemark);

    statistics = stats;
    location = placemark;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state');
    if (context.read<AppData>().stats == null ||
        context.read<AppData>().placemark == null) {
      print('Data not found');
      isLoading = true;
      getData();
    } else {
      isLoading = false;
      statistics = context.read<AppData>().stats;
      location = context.read<AppData>().placemark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingShimmerScreen()
        : HomeScreen(
            stats: statistics,
            placemark: location,
          );
  }
}
