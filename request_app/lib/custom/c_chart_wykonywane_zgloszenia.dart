import 'package:flutter/material.dart';
import 'package:request_app/models/m_chart_one.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartWykonywaneZgloszenia extends StatelessWidget {
  final List<ChartOne> data;

  ChartWykonywaneZgloszenia({required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartOne, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (ChartOne series, _) => series.day,
          measureFn: (ChartOne series, _) => series.iloscNowychZgloszen,
          colorFn: (ChartOne series, _) => series.barColor)
    ];

    return Container(
      height: 300,
      padding: EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                "Ilośc wykonywanych zgłoszeń",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
