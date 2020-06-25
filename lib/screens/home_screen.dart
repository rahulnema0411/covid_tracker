import 'package:covidtracker/models/card_data_type.dart';
import 'package:covidtracker/widgets/chart_card.dart';
import 'package:covidtracker/widgets/data_card.dart';
import 'package:covidtracker/widgets/state_data_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final CardDataType cardDataGlobal;
  final CardDataType cardDataCountry;
  final CardDataType cardDataState;

  HomeScreen(
      {@required this.cardDataGlobal,
      this.cardDataCountry,
      this.cardDataState});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          StateDataCard(
            cardDataState: widget.cardDataState,
          ),
          DataCard(
            cardData: widget.cardDataCountry,
          ),
          DataCard(
            cardData: widget.cardDataGlobal,
          ),
        ],
      ),
    );
  }
}
