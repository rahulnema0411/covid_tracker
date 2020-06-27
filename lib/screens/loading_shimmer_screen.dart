import 'package:covidtracker/constants.dart';
import 'package:covidtracker/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: cardColor_dark,
      highlightColor: Colors.grey[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: CustomCard(
              child: SizedBox(),
            ),
          ),
          Expanded(
            child: CustomCard(
              child: SizedBox(
                width: 100.0,
              ),
            ),
          ),
          Expanded(
            child: CustomCard(
              child: SizedBox(
                width: 100.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
