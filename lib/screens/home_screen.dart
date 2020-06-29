import 'dart:convert';
import 'package:covidtracker/models/card_data_type.dart';
import 'package:covidtracker/models/statistics.dart';
import 'package:covidtracker/models/table_data.dart';
import 'package:covidtracker/widgets/data_card.dart';
import 'package:covidtracker/widgets/state_data_card.dart';
import 'package:covidtracker/widgets/table_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Statistics stats;
  final List placemark;

  HomeScreen({@required this.stats, this.placemark});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _widgetList;

  int _selectedWidget = 0;

  CardDataType _cardDataGlobal;
  CardDataType _cardDataCountry;
  CardDataType _cardDataState;

  List<TableData> _countryStats;
  List<TableData> _stateStats;
  List<TableData> _districtStats;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _countryStats = widget.stats.getTableDataListCountry();
    _stateStats = widget.stats.getTableDataListState();
    _districtStats = widget.stats.getTableDataListDistrict();
    print('district');
    print(_districtStats);

    _widgetList = [
      _glanceView(),
      _detailedView(_districtStats),
      _detailedView(_stateStats),
      _detailedView(_countryStats),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _widgetList[_selectedWidget],
    );
  }

  Widget _glanceView() {
    _cardDataGlobal = widget.stats.getGlobalStatistics();
    _cardDataCountry =
        widget.stats.getCountryStatistics(widget.placemark[0].country);
    _cardDataState = widget.stats.getStateLevelStatistics(
        widget.placemark[0].country, widget.placemark[0].administrativeArea);

    return Column(
      children: <Widget>[
        StateDataCard(
          cardDataState: _cardDataState,
          onPressed: () {
            print('Tap Detected');
            setState(() {
              _selectedWidget = 1;
            });
          },
        ),
        DataCard(
          cardData: _cardDataCountry,
          onPressed: () {
            print('Tap Detected');
            setState(() {
              _selectedWidget = 2;
            });
          },
        ),
        DataCard(
          cardData: _cardDataGlobal,
          onPressed: () {
            print('Tap Detected');
            setState(() {
              _selectedWidget = 3;
            });
          },
        ),
      ],
    );
  }

  Widget _detailedView(List<TableData> tableData) {
    List<TableData> dd = [];
    dd.add(tableData[0]);

    return TableView(
      children: dd,
    );
  }
}
