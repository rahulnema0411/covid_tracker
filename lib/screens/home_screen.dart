import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import 'package:covidtracker/widgets/data_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'COVID Tracker',
          style: textStyle_dark.copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 28.0,
          ),
        ),
      ),
      body: Column(
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
        ],
      ),
    );
  }
}
