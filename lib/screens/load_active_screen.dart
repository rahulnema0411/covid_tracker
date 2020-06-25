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

    CardDataType cardDataGlobal = stats.getGlobalStatistics();
    CardDataType cardDataCountry =
        stats.getCountryStatistics(placemark[0].country);
    CardDataType cardDataLocal = stats.getStateLevelStatistics(
        placemark[0].country, placemark[0].administrativeArea);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActiveScreen(
          cardDataGlobal: cardDataGlobal,
          cardDataCountry: cardDataCountry,
          cardDataState: cardDataLocal,
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
