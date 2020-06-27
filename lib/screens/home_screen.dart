import 'package:covidtracker/models/card_data_type.dart';
import 'package:covidtracker/models/statistics.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cardDataGlobal = widget.stats.getGlobalStatistics();
    _cardDataCountry =
        widget.stats.getCountryStatistics(widget.placemark[0].country);
    _cardDataState = widget.stats.getStateLevelStatistics(
        widget.placemark[0].country, widget.placemark[0].administrativeArea);

    _widgetList = [
      _glanceView(_cardDataState, _cardDataCountry, _cardDataGlobal),
      _detailedView(),
      Center(
        child: Text('Hello1'),
      ),
      Center(
        child: Text('Hello2'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _widgetList[_selectedWidget],
    );
  }

  Widget _glanceView(CardDataType cardDataState, CardDataType cardDataCountry,
      CardDataType cardDataGlobal) {
    return Column(
      children: <Widget>[
        StateDataCard(
          cardDataState: cardDataState,
          onPressed: () {
            print('Tap Detected');
            setState(() {
              _selectedWidget = 1;
            });
          },
        ),
        DataCard(
          cardData: cardDataCountry,
          onPressed: () {
            print('Tap Detected');
            setState(() {
              _selectedWidget = 2;
            });
          },
        ),
        DataCard(
          cardData: cardDataGlobal,
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

  Widget _detailedView() {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              _selectedWidget = 0;
            });
          },
        )
      ],
    );
  }
}
