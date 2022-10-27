import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/chart_data.dart';
import '../provider/ChartDatas.dart';

class CandleStickChart extends StatefulWidget {
  const CandleStickChart({Key? key}) : super(key: key);

  @override
  State<CandleStickChart> createState() => _CandleStickChartState();
}

class _CandleStickChartState extends State<CandleStickChart> {
  late TooltipBehavior _tooltip;
  List<ChartData> data = [];

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await Provider.of<ChartDatas>(context).getData();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    data = Provider.of<ChartDatas>(context, listen: true).chartdata;

    return Container(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<ChartData, String>>[
          CandleSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.x,
            highValueMapper: (ChartData data, _) => data.high,
            closeValueMapper: (ChartData data, _) => data.close,
            lowValueMapper: (ChartData data, _) => data.low,
            openValueMapper: (ChartData data, _) => data.open,
            name: 'Gold',
            // bearColor: Color.fromRGBO(8, 142, 255, 1),
          )
        ]));
  }
}
