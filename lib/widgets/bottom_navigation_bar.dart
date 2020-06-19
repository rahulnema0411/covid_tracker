import 'package:covidtracker/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color selectedColor;

class BottomNavBar extends StatefulWidget {
  BottomNavBar(
      {this.selectedItem,
      this.onTap,
      this.selectedTabColor = backGroundColor_dark,
      this.backgroundColor = cardColor_dark}) {
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
        color: widget.backgroundColor,
      ),
      height: 60.0,
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
            icon: FontAwesomeIcons.globeAmericas,
            index: 2,
            onTap: widget.onTap,
            label: 'World',
          ),
          BottomNavBarItem(
            isSelected: widget.selectedItem == 3,
            icon: FontAwesomeIcons.heartbeat,
            index: 3,
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
          elevation: 3.5,
          child: Container(
              color: isSelected ? selectedColor : Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    semanticLabel: label,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    label,
                    style: TextStyle(fontSize: isSelected ? 11.0 : 0.0),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
