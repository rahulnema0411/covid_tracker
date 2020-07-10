import 'package:covidtracker/widgets/news_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/constants.dart';
import 'package:flutter/rendering.dart';

class HealthCheckScreen extends StatefulWidget {
  @override
  _HealthCheckScreenState createState() => _HealthCheckScreenState();
}

class _HealthCheckScreenState extends State<HealthCheckScreen> {
  List<Widget> _widgetList;
  int _selectedWidget = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedWidget = 0;
    _widgetList = [
      healthScreen(),
      NewsWebView('url', onButtonPress),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _widgetList[_selectedWidget];
  }

  Widget healthScreen() {
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              symptomsSection(),
              reusableCard(
                  'Protect yourself from COVID-19',
                  'images/facial_mask_coronavirus.png',
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public'),
              reusableCardTwo(),
            ],
          ),
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
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Symptoms',
                style: cardHeading_textStyle,
              ),
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

  Widget reusableCard(String title, String url, String webUrl) {
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
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          'Visit WHO for more Info',
                          style: cardData_textStyle,
                        ),
                      ),
                      onPressed: () {
                        onButtonPress(webUrl);
                      },
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

  Widget reusableCardTwo() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: cardColor_dark,
        elevation: 10.0,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Text(
                'Stay Healthy at Home',
                style: cardsubHeading_textStyle,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
              child: Text(
                'See what WHO has to say...',
                style: cardData_textStyle,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  customFlatButton(
                    'Stay Physically Active',
                    'images/dumbbell.png',
                    'https://www.who.int/news-room/campaigns/connecting-the-world-to-combat-coronavirus/healthyathome/healthyathome---physical-activity',
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  customFlatButton(
                    'Maintain Healthy Diet',
                    'images/diet.png',
                    'https://www.who.int/news-room/campaigns/connecting-the-world-to-combat-coronavirus/healthyathome/healthyathome---healthy-diet',
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  customFlatButton(
                    'Healthy Parenting',
                    'images/family.png',
                    'https://www.who.int/news-room/campaigns/connecting-the-world-to-combat-coronavirus/healthyathome/healthyathome---healthy-parenting',
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  customFlatButton(
                    'Mental Health',
                    'images/brain.png',
                    'https://www.who.int/news-room/campaigns/connecting-the-world-to-combat-coronavirus/healthyathome/healthyathome---mental-health',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onButtonPress(String goToUrl) {
    NewsWebView newsWebView = NewsWebView(goToUrl, showHealthScreen);
    _widgetList[1] = newsWebView;

    setState(() {
      _selectedWidget = 1;
    });
  }

  void showHealthScreen() {
    setState(() {
      _selectedWidget = 0;
    });
  }

  Widget customFlatButton(String txt, String urlToImage, String urlToWeb) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: backGroundColor_dark,
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Image(
                height: 30.0,
                width: 30.0,
                image: AssetImage(urlToImage),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                txt,
                style: cardsubHeading_textStyle,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        onButtonPress(urlToWeb);
      },
    );
  }
}
