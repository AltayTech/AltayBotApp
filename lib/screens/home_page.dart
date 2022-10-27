import 'package:altay_bot/provider/ChartDatas.dart';
import 'package:altay_bot/screens/candlestick_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/chart_data.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'BackTest:',
                  style: TextStyle(fontSize: 30),
                ),
                const Text(
                  'Counter:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Row(
                  children: [
                    const Text(
                      'Start year:',
                    ),
                    Container(height: 30, width: 100, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'End year:',
                    ),
                    Container(height: 30, width: 100, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Time interval:',
                    ),
                    Container(height: 30, width: 100, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'TP Constant:',
                    ),
                    Container(height: 30, width: 100, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'SL Constant:',
                    ),
                    Container(height: 30, width: 100, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Last Candles Confirmation Steps:',
                    ),
                    Container(height: 30, width: 100, child: TextField()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Next candle Confirmation:',
                    ),
                    Container(height: 30, width: 100, child: TextField()),
                  ],
                ),
              ],
            ),
            Container(
              constraints: BoxConstraints.expand(height: 400, width: 500),
              child: CandleStickChart(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
