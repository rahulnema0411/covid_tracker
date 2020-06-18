import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter/rendering.dart';

class DataCard extends StatelessWidget {
  final String totalConfirmed;
  final String totalRecovered;
  final String totalDeaths;

  final String newConfirmed;
  final String newRecovered;
  final String newDeaths;

  DataCard(
      {this.totalConfirmed,
      this.totalRecovered,
      this.totalDeaths,
      this.newConfirmed,
      this.newRecovered,
      this.newDeaths});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor_dark,
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.topLeft,
            child: Text(
              'Madhya Pradesh',
              style: cardHeading_textStyle,
            ),
          ), //heading
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              'Active Cases : 320922',
              style: cardsubHeading_textStyle,
            ),
          ), //subheading
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total Confirmed  :  ',
                      style: cardData_textStyle,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Total Recovered  :  ',
                      style: cardData_textStyle,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Total Deaths        :  ',
                      style: cardData_textStyle,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      totalConfirmed,
                      style: cardData_textStyle,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      totalRecovered,
                      style: cardData_textStyle,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      totalDeaths,
                      style: cardData_textStyle,
                    ),
                  ],
                ), //recovered
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_drop_up,
                          color: accentColor_red,
                        ),
                        Text(
                          newConfirmed,
                          style: cardData_textStyle.copyWith(
                            fontSize: 10.0,
                            color: accentColor_red,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_drop_up,
                          color: accentColor_green,
                        ),
                        Text(
                          newRecovered,
                          style: cardData_textStyle.copyWith(
                            fontSize: 10.0,
                            color: accentColor_green,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.arrow_drop_down),
                        Text(
                          newDeaths,
                          style: cardData_textStyle.copyWith(
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ), //deaths
              ],
            ),
          )
        ],
      ),
    );
  }
}
