import 'dart:math';

/// Gauge chart example, where the data does not cover a full revolution in the
/// chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GaugeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GaugeChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory GaugeChart.withSampleData() {
    return new GaugeChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  Widget _richText(String i1,String i2){
    List<TextSpan> tsList = new List<TextSpan>();
    tsList.add(TextSpan(text:i1,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)));
    tsList.add(TextSpan(text: '\r\n'));
    tsList.add(TextSpan(text: i2,style: TextStyle(fontSize: 14)));
    TextSpan result = new TextSpan(children: tsList);
    return Text.rich(result,textAlign: TextAlign.center,);
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new charts.PieChart(seriesList,
          animate: animate,
          behaviors: [new charts.DatumLegend(
            position: charts.BehaviorPosition.end,
            outsideJustification: charts.OutsideJustification.endDrawArea,
          ),
          // _richText('84%', '年累计完成率'),
          ],
          // Configure the width of the pie slices to 30px. The remaining space in
          // the chart will be left as a hole in the center. Adjust the start
          // angle and the arc length of the pie so it resembles a gauge.
          defaultRenderer: new charts.ArcRendererConfig(
              arcWidth: 10, startAngle: -1 / 2 * pi, arcLength: 2 * pi)),
        new Positioned(
          
          left: -80,
          top: 120,
          right: 10,
          child: _richText('84%', '年累计完成率'),
        ),     
      ],
    );
    // return new charts.PieChart(seriesList,
    //     animate: animate,
        
    //     // Configure the width of the pie slices to 30px. The remaining space in
    //     // the chart will be left as a hole in the center. Adjust the start
    //     // angle and the arc length of the pie so it resembles a gauge.
    //     defaultRenderer: new charts.ArcRendererConfig(
    //         arcWidth: 10, startAngle: -1 / 2 * pi, arcLength: 2 * pi));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<GaugeSegment, String>> _createSampleData() {
    final data = [
      new GaugeSegment('目前已完成', 84),
      new GaugeSegment('年度目标', 26),
      // new GaugeSegment('High', 50),
      // new GaugeSegment('Highly Unusual', 5),
    ];

    return [
      new charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        data: data,
      )
    ];
  }
}

/// Sample data type.
class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}