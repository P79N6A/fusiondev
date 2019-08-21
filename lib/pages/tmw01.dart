import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/// Example that shows how to build a series legend that shows measure values
/// when a datum is selected.
///
/// Also shows the option to provide a custom measure formatter.
class TMWPage01 extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TMWPage01(this.seriesList, {this.animate});

  factory TMWPage01.withSampleData() {
    return new TMWPage01(
      _createSampleData(), //withTMWData({"NotStarting":7,"OverdueTask":230,"ThisWeekTask":0,"LastWeekTask":48}),
      // Disable animations for image tests.
      animate: true,
    );
  }

  factory TMWPage01.withTMWidget(Map<String, dynamic> data) {
    return new TMWPage01(withTMWData(data), animate: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width:MediaQuery.of(context).size.width-40,
      child:
      new charts.BarChart(
          seriesList,
          animate: animate,

          vertical: false,
          // barGroupingType: charts.BarGroupingType.grouped,
          // Add the legend behavior to the chart to turn on legends.
          // This example shows how to optionally show measure and provide a custom
          // formatter.

          barRendererDecorator: new charts.BarLabelDecorator<String>(),
          behaviors: [
            new charts.ChartTitle('预警提醒',
                // subTitle: 'Top sub-title text',
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification: charts.OutsideJustification.start,
                innerPadding: 18),
            new charts.SeriesLegend(
              // Positions for "start" and "end" will be left and right respectively
              // for widgets with a build context that has directionality ltr.
              // For rtl, "start" and "end" will be right and left respectively.
              // Since this example has directionality of ltr, the legend is
              // positioned on the right side of the chart.
              position: charts.BehaviorPosition.bottom,
              // By default, if the position of the chart is on the left or right of
              // the chart, [horizontalFirst] is set to false. This means that the
              // legend entries will grow as new rows first instead of a new column.
              horizontalFirst: false,

              // This defines the padding around each legend entry.
              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
              // Set show measures to true to display measures in series legend,
              // when the datum is selected.
              showMeasures: true,
              // Optionally provide a measure formatter to format the measure value.
              // If none is specified the value is formatted as a decimal.
              measureFormatter: (num value) {
                return value == null ? '-' : '${value}';
              },
            ),
          ],
        ));
  }

// {"result":{"errorField":"","rowIndex":-1,"resultObj":{"NotStarting":7,"OverdueTask":230,"ThisWeekTask":"0","LastWeekTask":"48"}},"exMessage":"","resultState":0,"upTime":8555587356,"downTime":8555587398,"serviceDistribute":"Y"}

  static List<charts.Series<OrdinalSales, String>> withTMWData(
      Map<String, dynamic> data) {
    // if(data == null || data.length == 0{return null;}
    final desktopSalesData = [
      new OrdinalSales('将超期任务', data['OverdueTask']),
      new OrdinalSales('未按计划开始', data['NotStarting']),
      new OrdinalSales('上周计划',
          data['LastWeekTask'] == null ? 0 : int.parse(data['LastWeekTask'])),
      new OrdinalSales('本周计划',
          data['ThisWeekTask'] == null ? 0 : int.parse(data['ThisWeekTask'])),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: '将超期任务',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesData,
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.sales.toString()}个')
    ];
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2013', 5),
    ];

    final tabletSalesData = [
      new OrdinalSales('2014', 25),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10),
    ];

    final otherSalesData = [
      new OrdinalSales('2014', 20),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tabletSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Other',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: otherSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

// // Copyright 2018 the Charts project authors. Please see the AUTHORS file
// // for details.
// //
// // Licensed under the Apache License, Version 2.0 (the "License");
// // you may not use this file except in compliance with the License.
// // You may obtain a copy of the License at
// //
// // http://www.apache.org/licenses/LICENSE-2.0
// //
// // Unless required by applicable law or agreed to in writing, software
// // distributed under the License is distributed on an "AS IS" BASIS,
// // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// // See the License for the specific language governing permissions and
// // limitations under the License.

// /// Bar chart with series legend example
// // EXCLUDE_FROM_GALLERY_DOCS_START
// import 'dart:math';
// // EXCLUDE_FROM_GALLERY_DOCS_END
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class SimpleSeriesLegend extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   SimpleSeriesLegend(this.seriesList, {this.animate});

//   // factory SimpleSeriesLegend.withSampleData() {
//   //   return new SimpleSeriesLegend(
//   //     _createSampleData(),
//   //     // Disable animations for image tests.
//   //     animate: true,
//   //   );
//   // }

//   factory SimpleSeriesLegend.withTMWData(Map<String, dynamic> warning) {

//     return new SimpleSeriesLegend(

//       _createSampleData(warning),
//       animate: true,
//     );
//   }

//   // EXCLUDE_FROM_GALLERY_DOCS_START
//   // This section is excluded from being copied to the gallery.
//   // It is used for creating random series data to demonstrate animation in
//   // the example app only.

//   // EXCLUDE_FROM_GALLERY_DOCS_END

//   @override
//   Widget build(BuildContext context) {
//     return new charts.BarChart(
//       seriesList,
//       animate: animate,
//       barGroupingType: charts.BarGroupingType.grouped,
//       // Add the series legend behavior to the chart to turn on series legends.
//       // By default the legend will display above the chart.
//       behaviors: [new charts.SeriesLegend()],
//     );
//   }

//   /// Create series list with multiple series
//   static List<charts.Series<OrdinalSales, String>> _createSampleData(Map<String, dynamic> warning) {
//     final desktopSalesData = [
//       new OrdinalSales('2014', 5),
//       new OrdinalSales('2015', 25),
//       new OrdinalSales('2016', 100),
//       new OrdinalSales('2017', 75),
//     ];

//     final tabletSalesData = [
//       new OrdinalSales('2014', 25),
//       new OrdinalSales('2015', 50),
//       new OrdinalSales('2016', 10),
//       new OrdinalSales('2017', 20),
//     ];

//     final mobileSalesData = [
//       new OrdinalSales('2014', 10),
//       new OrdinalSales('2015', 15),
//       new OrdinalSales('2016', 50),
//       new OrdinalSales('2017', 45),
//     ];

//     final otherSalesData = [
//       new OrdinalSales('2014', 20),
//       new OrdinalSales('2015', 35),
//       new OrdinalSales('2016', 15),
//       new OrdinalSales('2017', 10),
//     ];

//     return [
//       new charts.Series<OrdinalSales, String>(
//         id: '将超期',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: desktopSalesData,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: '未按计划开始',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: tabletSalesData,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: '上周计划',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: mobileSalesData,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: '本周计划',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: otherSalesData,
//       ),
//     ];
//   }
// }

// /// Sample ordinal data type.
// class OrdinalSales {
//   final String year;
//   final int sales;

//   OrdinalSales(this.year, this.sales);
// }
