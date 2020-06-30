import 'package:covidtracker/constants.dart';
import 'package:covidtracker/screens/home_screen_switch.dart';
import 'package:covidtracker/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ActiveScreen extends StatefulWidget {
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
      HomeScreenSwitch(),
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
    return Scaffold(
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
