import 'package:covidtracker/models/card_data_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter/rendering.dart';

class DataCard extends StatelessWidget {
  final CardDataType cardData;
  final Function onPressed;

  DataCard({this.cardData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Padding(
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
                  cardData.location,
                  style: cardHeading_textStyle,
                ),
              ), //heading
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Active Cases : ${cardData.activeCases}',
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
                          cardData.confirmed,
                          style: cardData_textStyle,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          cardData.recovered,
                          style: cardData_textStyle,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          cardData.deceased,
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
                              cardData.newConfirmed,
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
                              cardData.newRecovered,
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
                              cardData.newDeaths,
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
            ],
          ),
        ),
      ),
    );
  }
}
