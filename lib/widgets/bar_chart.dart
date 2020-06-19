import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('1', 5),
      new OrdinalSales('2', 25),
      new OrdinalSales('3', 200),
      new OrdinalSales('4', 75),
      new OrdinalSales('5', 85),
      new OrdinalSales('6', 25),
      new OrdinalSales('7', 55),
      new OrdinalSales('8', 45),
      new OrdinalSales('9', 95),
      new OrdinalSales('10', 5),
      new OrdinalSales('11', 25),
      new OrdinalSales('12', 100),
      new OrdinalSales('13', 75),
      new OrdinalSales('14', 85),
      new OrdinalSales('15', 25),
      new OrdinalSales('16', 5),
      new OrdinalSales('17', 25),
      new OrdinalSales('18', 200),
      new OrdinalSales('19', 75),
      new OrdinalSales('20', 85),
      new OrdinalSales('21', 25),
      new OrdinalSales('22', 55),
      new OrdinalSales('23', 45),
      new OrdinalSales('24', 95),
      new OrdinalSales('25', 5),
      new OrdinalSales('26', 25),
      new OrdinalSales('27', 100),
      new OrdinalSales('28', 75),
      new OrdinalSales('29', 85),
      new OrdinalSales('30', 25),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
