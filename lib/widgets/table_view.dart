import 'package:covidtracker/constants.dart';
import 'package:covidtracker/models/table_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card.dart';

class TableView extends StatelessWidget {
  TableView({this.children});

  final List<TableData> children;

  List<Widget> _getWidgetsList() {
    List<Widget> list = [];
    list.add(
      _TableViewItem(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        children: <Widget>[
          Expanded(
            child: Text(
              'Country',
              textAlign: TextAlign.center,
              style: kTextViewHeading,
            ),
            flex: 5,
          ),
          Expanded(
            child: Text(
              'Confirmed',
              style: kTextViewHeading,
              textAlign: TextAlign.start,
            ),
            flex: 3,
          ),
          Expanded(
            child: Text(
              'Recovered',
              style: kTextViewHeading,
              textAlign: TextAlign.start,
            ),
            flex: 3,
          ),
          Expanded(
            child: Text(
              'Deceased',
              style: kTextViewHeading,
              textAlign: TextAlign.start,
            ),
            flex: 3,
          ),
        ],
      ),
    );

    if (children == null) {
      return list;
    }
    for (var data in children) {
      list.add(_TableViewItem(
        children: <Widget>[
          Expanded(
            child: Text(
              data.location,
              textAlign: TextAlign.center,
              style: kTextViewData,
            ),
            flex: 5,
          ),
          Expanded(
            child: Text(
              '${data.confirmed}',
              textAlign: TextAlign.center,
              style: kTextViewData,
            ),
            flex: 3,
          ),
          Expanded(
            child: Text(
              '${data.recovered}',
              textAlign: TextAlign.center,
              style: kTextViewData,
            ),
            flex: 3,
          ),
          Expanded(
            child: Text(
              '${data.deceased}',
              textAlign: TextAlign.center,
              style: kTextViewData,
            ),
            flex: 3,
          ),
        ],
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: _getWidgetsList(),
      ),
    );
  }
}

class _TableViewItem extends StatelessWidget {
  final BorderRadius borderRadius;
  final List<Widget> children;

  _TableViewItem({this.borderRadius, this.children});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: borderRadius,
      padding: EdgeInsets.all(4.0),
      child: Container(
        height: 40.0,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children),
      ),
    );
  }
}
