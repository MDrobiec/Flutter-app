import 'package:charts_flutter/flutter.dart' as charts;

class ChartTwo {
  final int day;
  final int iloscWykonanychZgloszen;
  final charts.Color barColor;

  ChartTwo(
      {required this.day,
      required this.iloscWykonanychZgloszen,
      required this.barColor});
}
