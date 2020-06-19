import 'package:covidtracker/widgets/chart_card.dart';
import 'package:covidtracker/widgets/data_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.0),
          child: DataCard(
            totalConfirmed: '10,395',
            totalRecovered: '7904',
            totalDeaths: '546',
            newConfirmed: '1500',
            newRecovered: '150',
            newDeaths: '20',
          ),
        ),
        ChartCard(),
      ],
    );
  }
}
