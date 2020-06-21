import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import 'package:covidtracker/widgets/bar_chart.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300.0,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            bottomNavigationBar: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              color: cardColor_dark,
              elevation: 5.0,
              child: TabBar(
                indicatorColor: textColor_dark,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.all(4.0),
                tabs: <Widget>[
                  Text(
                    'Confirmed',
                    style: cardData_textStyle,
                  ),
                  Text(
                    'Recovered',
                    style: cardData_textStyle,
                  ),
                  Text(
                    'Deceased',
                    style: cardData_textStyle,
                  ),
                ],
              ),
            ),
            body: Card(
              color: cardColor_dark,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: TabBarView(
                  children: <Widget>[
                    SimpleBarChart.withSampleData(),
                    SimpleBarChart.withSampleData(),
                    SimpleBarChart.withSampleData(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
