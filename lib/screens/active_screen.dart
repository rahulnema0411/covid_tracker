import 'package:covidtracker/constants.dart';
import 'package:covidtracker/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class ActiveScreen extends StatefulWidget {
  @override
  _ActiveScreenState createState() => _ActiveScreenState();
}

class _ActiveScreenState extends State<ActiveScreen> {
  //TODO: Add all the screens here..
  List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    Center(
      child: Text('OK'),
    )
  ];

  int selectedScreen = 0;
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
    );
  }
}
