import 'package:charts_flutter/flutter.dart' as charts;

class ChartOne {
  final String day;
  final int iloscNowychZgloszen;
  final charts.Color barColor;

  ChartOne(
      {required this.day,
      required this.iloscNowychZgloszen,
      required this.barColor});
}
