import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter/rendering.dart';

class StateDataCard extends StatelessWidget {
  final String totalConfirmed;
  final String totalRecovered;
  final String totalDeaths;

  final String newConfirmed;
  final String newRecovered;
  final String newDeaths;

  final String recoveryRate;
  final String activeRate;
  final String deathRate;

  StateDataCard(
      {this.totalConfirmed,
      this.totalRecovered,
      this.totalDeaths,
      this.newConfirmed,
      this.newRecovered,
      this.newDeaths,
      this.recoveryRate,
      this.activeRate,
      this.deathRate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.0),
      child: Card(
        color: cardColor_dark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 5.0,
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
                        height: 6.0,
                      ),
                      Text(
                        'Total Recovered  :  ',
                        style: cardData_textStyle,
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Total Deaths        :  ',
                        style: cardData_textStyle,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Recovery Rate',
                          style: cardData_textStyle.copyWith(
                            color: accentColor_green,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          recoveryRate,
                          style: cardData_textStyle.copyWith(
                            color: accentColor_green,
                            fontSize: 12.0,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Active Rate',
                          style: cardData_textStyle.copyWith(
                            color: accentColor_red,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          activeRate,
                          style: cardData_textStyle.copyWith(
                            color: accentColor_red,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Death Rate',
                          style: cardData_textStyle.copyWith(
                            color: textColor_dark,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          deathRate,
                          style: cardData_textStyle.copyWith(
                            color: textColor_dark,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
