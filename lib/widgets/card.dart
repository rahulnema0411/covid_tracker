import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({this.child, this.padding, this.borderRadius});
  final Widget child;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        color: cardColor_dark,
        borderRadius:
            borderRadius != null ? borderRadius : BorderRadius.circular(8.0),
        elevation: 5.0,
        child: child,
      ),
    );
  }
}
