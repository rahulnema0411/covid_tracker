import 'package:covidtracker/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color selectedColor;

class BottomNavBar extends StatefulWidget {
  BottomNavBar(
      {this.selectedItem,
      this.onTap,
      this.selectedTabColor = Colors.black,
      this.backgroundColor = Colors.black}) {
    selectedColor = selectedTabColor;
  }

  final int selectedItem;
  final Function onTap;
  final Color selectedTabColor;
  final Color backgroundColor;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 54.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BottomNavBarItem(
            isSelected: widget.selectedItem == 0,
            icon: FontAwesomeIcons.chartBar,
            index: 0,
            onTap: widget.onTap,
            label: 'Stats',
          ),
          BottomNavBarItem(
            isSelected: widget.selectedItem == 1,
            icon: FontAwesomeIcons.newspaper,
            index: 1,
            onTap: widget.onTap,
            label: 'News',
          ),
          BottomNavBarItem(
            isSelected: widget.selectedItem == 2,
            icon: FontAwesomeIcons.heartbeat,
            index: 2,
            onTap: widget.onTap,
            label: 'Self-Assessment',
          ),
        ],
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  BottomNavBarItem(
      {this.icon, this.isSelected, this.label, this.index, this.onTap});

  final IconData icon;
  final bool isSelected;
  final String label;
  final int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Material(
          //elevation: 3.5,
          child: Container(
              color: Colors.black54,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    semanticLabel: label,
                    color: isSelected ? accentColor_red : Colors.white,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                        fontSize: isSelected ? 11.0 : 0.0,
                        color: isSelected ? accentColor_red : Colors.white,
                        fontFamily: 'NunitoSans'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
