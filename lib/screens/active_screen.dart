import 'package:covidtracker/constants.dart';
import 'package:covidtracker/models/statistics.dart';
import 'package:covidtracker/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class ActiveScreen extends StatefulWidget {
  final List placemark;
  final Statistics stats;

  ActiveScreen({@required this.placemark, this.stats});

  @override
  _ActiveScreenState createState() => _ActiveScreenState();
}

class _ActiveScreenState extends State<ActiveScreen> {
  List<Widget> screens;

  int selectedScreen = 0;

  @override
  void initState() {
    super.initState();

    screens = [
      HomeScreen(
        stats: widget.stats,
        placemark: widget.placemark,
      ),
      Center(
        child: Text('OK'),
      ),
      Center(
        child: Text('OK'),
      ),
      Center(
        child: Text('OK'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          centerTitle: true,
          title: Text(
            'COVID Tracker',
            style: textStyle_dark.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 28.0,
            ),
          ),
        ),
        body: screens[selectedScreen],
        bottomNavigationBar: BottomNavBar(
          selectedItem: selectedScreen,
          onTap: (index) {
            setState(() {
              selectedScreen = index;
              print(selectedScreen);
            });
          },
        ),
      ),
    );
  }
}
