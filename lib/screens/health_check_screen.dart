import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter/rendering.dart';

class HealthCheckScreen extends StatefulWidget {
  @override
  _HealthCheckScreenState createState() => _HealthCheckScreenState();
}

class _HealthCheckScreenState extends State<HealthCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Stay Home, Stay Safe',
          style: textStyle_dark.copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 28.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            symptomsSection(),
            reusableCard('Stay home to stop Corona Virus',
                'images/facial_mask_coronavirus.png'),
            reusableCard(
                'Boost your immunity', 'images/facial_mask_coronavirus.png'),
          ],
        ),
      ),
    );
  }

  Widget symptomsCard(String symptom, String detail, String url) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: cardColor_dark,
      elevation: 10.0,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              height: 96.0,
              width: 96.0,
              image: AssetImage(url),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 8, 8),
                child: Text(
                  symptom,
                  style: cardsubHeading_textStyle,
                ),
              ),
              Container(
                width: 180.0,
                child: Text(
                  detail,
                  style: cardData_textStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget symptomsSection() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Symptoms',
                  style: cardHeading_textStyle,
                ),
                Text(
                  'View all',
                  style: cardData_textStyle,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                symptomsCard(
                    'Fever',
                    'Body temperature higher than usual, weakness etc. ',
                    'images/fever_high_temperature.png'),
                symptomsCard(
                    'Cough',
                    'Dry cough, shortness of breath, sore throat.',
                    'images/cough_coughing_symptom.png'),
                symptomsCard('Fatigue', 'Feeling week/tired all the time',
                    'images/tiredness_tired_fatigue.png'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget reusableCard(String title, String url) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: cardColor_dark,
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    width: 180.0,
                    child: Text(
                      title,
                      style: cardsubHeading_textStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: FlatButton(
                      color: backGroundColor_dark,
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                        'Know More',
                        style: cardData_textStyle,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  height: 128.0,
                  width: 128.0,
                  image: AssetImage(url),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
