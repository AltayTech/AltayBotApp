import 'package:flutter/widgets.dart';

class ChartData with ChangeNotifier {
  final String x;
  final double y;
  final double high;
  final double low;
  final double close;
  final double open;

  ChartData(
    this.x,
    this.y,
    this.high,
    this.open,
    this.close,
    this.low,
  );
}
