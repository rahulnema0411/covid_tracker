import 'package:covidtracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerScreen extends StatelessWidget {
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
      body: Shimmer.fromColors(
        baseColor: cardColor_dark,
        highlightColor: Colors.grey[850],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Card(),
            ),
            Expanded(
              child: Card(),
            ),
            Expanded(
              child: Card(),
            ),
          ],
        ),
      ),
    );
  }
}

//Expanded(
//child: CustomCard(
//child: SizedBox(),
//),
//),
//Expanded(
//child: CustomCard(
//child: SizedBox(
//width: 100.0,
//),
//),
//),
//Expanded(
//child: CustomCard(
//child: SizedBox(
//width: 100.0,
//),
//),
//),
