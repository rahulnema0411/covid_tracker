import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';

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
          ),
        ),
      ),
    );
  }
}
