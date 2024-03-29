// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Bar chart with example of a legend with customized position, justification,
/// desired max rows, and padding. These options are shown as an example of how
/// to use the customizations, they do not necessary have to be used together in
/// this way. Choosing [end] as the position does not require the justification
/// to also be [endDrawArea].
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/// Example that shows how to build a datum legend that shows measure values.
///
/// Also shows the option to provide a custom measure formatter.
class DatumLegendWithMeasures extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DatumLegendWithMeasures(this.seriesList, {this.animate});

  factory DatumLegendWithMeasures.withSampleData() {
    return new DatumLegendWithMeasures(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory DatumLegendWithMeasures.withRandomData() {
    return new DatumLegendWithMeasures(_createRandomData());
  }

  factory DatumLegendWithMeasures.withTMWData(Map<String, dynamic> map) {
// "{TaskSum: 464, CompleteTask: 423, SurplusTask: 4, HaveInHandTask: 0, ToBeReleasedtask: 12, ToBeVerifiedtask: 25}"
    final data = [
      new LinearSales(
          '未开始',
          map['SurplusTask'] != null
              ? num.parse(map['SurplusTask'])
              : 0), // 未开始
      new LinearSales(
          '进行中',
          map['HaveInHandTask'] != null
              ? num.parse(map['HaveInHandTask'])
              : 0), // 进行中
      new LinearSales(
          '待发布',
          map['ToBeReleasedtask'] != null
              ? num.parse(map['ToBeReleasedtask'])
              : 0), // 待发布
      new LinearSales(
          '待验证',
          map['ToBeVerifiedtask'] != null
              ? num.parse(map['ToBeVerifiedtask'])
              : 0), // 待验证
      new LinearSales(
          '已完成',
          map['CompleteTask'] != null
              ? num.parse(map['CompleteTask'])
              : 0), // 待验证
    ];

    var data1 = [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${row.year}:${row.sales}',
      )
    ];
    return new DatumLegendWithMeasures(data1);
  }

  /// Create random data.
  static List<charts.Series<LinearSales, String>> _createRandomData() {
    final random = new Random();

    final data = [
      // new LinearSales(2014, random.nextInt(100)),
      // new LinearSales(2015, random.nextInt(100)),
      // new LinearSales(2016, random.nextInt(100)),
      // new LinearSales(2017, random.nextInt(100)),
    ];

    return [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width:MediaQuery.of(context).size.width-40,
      color: Colors.blueAccent,
      child:
      
      new charts.PieChart(
              seriesList,
              animate: animate,
              // Add the legend behavior to the chart to turn on legends.
              // This example shows how to optionally show measure and provide a custom
              // formatter.
              behaviors: [
                new charts.ChartTitle('任务总览',
                    // subTitle: 'Top sub-title text',
                    behaviorPosition: charts.BehaviorPosition.top,
                    titleOutsideJustification:
                        charts.OutsideJustification.start,
                    innerPadding: 18),
                // EXCLUDE_FROM_GALLERY_DOCS_START
                // This section is excluded from being copied to the gallery.
                // This is added in order to generate the image for the gallery to show
                // an initial selection so that measure values are shown in the gallery.
                new charts.InitialSelection(
                  selectedDataConfig: [
                    new charts.SeriesDatumConfig('Sales', 0),
                  ],
                ),
                // EXCLUDE_FROM_GALLERY_DOCS_END
                new charts.DatumLegend(
                  // Positions for "start" and "end" will be left and right respectively
                  // for widgets with a build context that has directionality ltr.
                  // For rtl, "start" and "end" will be right and left respectively.
                  // Since this example has directionality of ltr, the legend is
                  // positioned on the right side of the chart.
                  position: charts.BehaviorPosition.end,
                  // By default, if the position of the chart is on the left or right of
                  // the chart, [horizontalFirst] is set to false. This means that the
                  // legend entries will grow as new rows first instead of a new column.
                  horizontalFirst: false,
                  // This defines the padding around each legend entry.
                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                  // Set [showMeasures] to true to display measures in series legend.
                  showMeasures: true,
                  // Configure the measure value to be shown by default in the legend.
                  legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
                  // Optionally provide a measure formatter to format the measure value.
                  // If none is specified the value is formatted as a decimal.
                  measureFormatter: (num value) {
                    return value == null ? '-' : '${value}个';
                  },
                ),
              ],
            )
    );
    
  }

  /// Create series list with one series
  static List<charts.Series<LinearSales, String>> _createSampleData() {
    final data = [
      // new LinearSales(2014, 100),
      // new LinearSales(2015, 75),
      // new LinearSales(2016, 25),
      // new LinearSales(2017, 5),
    ];

    return [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final String year;
  final int sales;

  LinearSales(this.year, this.sales);
}
