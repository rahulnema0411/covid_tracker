import 'package:covidtracker/models/card_data_type.dart';
import 'package:covidtracker/models/statistics.dart';
import 'package:covidtracker/models/table_data.dart';
import 'package:covidtracker/widgets/data_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

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
    super.initState();

    _countryStats = widget.stats.getTableDataListCountry();
    _stateStats = widget.stats.getTableDataListState();
    _districtStats = widget.stats.getTableDataListDistrict();

    _countryStats.sort((a, b) => b.confirmed.compareTo(a.confirmed));
    _stateStats.sort((a, b) => b.confirmed.compareTo(a.confirmed));
    _districtStats.sort((a, b) => b.confirmed.compareTo(a.confirmed));

    _widgetList = [
      _glanceView(),
      _detailedView(_districtStats, 'District'),
      _detailedView(_stateStats, 'State'),
      _detailedView(_countryStats, 'Country'),
    ];
  }

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
        leading: _selectedWidget == 0
            ? button(Icon(Icons.menu), () {})
            : button(Icon(Icons.arrow_back), () {
                setState(() {
                  _selectedWidget = 0;
                });
              }),
      ),
      body: SingleChildScrollView(
        child: _widgetList[_selectedWidget],
      ),
    );
  }

  Widget button(Icon icon, Function onPress) {
    return FlatButton(
      child: icon,
      onPressed: onPress,
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
        DataCard(
          cardData: _cardDataState,
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

  Widget _detailedView(List<TableData> tableData, String category) {
    List<Widget> list = _tableViewRowList(tableData);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    category,
                    style: tabletextStyle_dark.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Confirmed',
                    style: tabletextStyle_dark.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Recovered',
                    style: tabletextStyle_dark.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Deceased',
                    style: tabletextStyle_dark.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: cardColor_dark,
          elevation: 10.0,
          child: Column(
            children: list,
          ),
        ),
      ],
    );
  }

  Widget _tableViewRow(TableData tableData) {
    //TODO:: design this widget
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    tableData.location,
                    style: tabletextStyle_dark,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    tableData.confirmed.toString(),
                    style: tabletextStyle_dark,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    tableData.recovered.toString(),
                    style: tabletextStyle_dark,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    tableData.deceased.toString(),
                    style: tabletextStyle_dark,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 20.0,
        ),
      ],
    );
  }

  List<Widget> _tableViewRowList(List<TableData> tableData) {
    List<Widget> list = [];
    for (int i = 0; i < tableData.length; i++) {
      list.add(_tableViewRow(tableData[i]));
    }
    return list;
  }
}
