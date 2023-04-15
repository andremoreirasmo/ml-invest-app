import 'package:flutter/material.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartStock extends StatelessWidget {
  List<Quotes>? chartData = [];

  ChartStock({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return WidgetUtil.showIf(
        chartData != null,
        () => Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(209, 15, 15, 15),
                borderRadius: BorderRadius.circular(8),
                border:
                    Border.all(color: const Color.fromARGB(132, 15, 15, 15)),
              ),
              child: Column(
                children: [
                  SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      backgroundColor: const Color.fromARGB(132, 15, 15, 15),
                      primaryXAxis: DateTimeAxis(
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          majorGridLines: const MajorGridLines(width: 0),
                          intervalType: DateTimeIntervalType.minutes),
                      primaryYAxis: NumericAxis(
                        axisLine: const AxisLine(width: 0),
                        majorTickLines:
                            const MajorTickLines(color: Colors.transparent),
                      ),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries>[
                        CandleSeries<Quotes, DateTime>(
                          name: 'Dados',
                          dataSource: chartData!,
                          xValueMapper: (Quotes data, _) => data.date,
                          lowValueMapper: (Quotes data, _) => data.low,
                          highValueMapper: (Quotes data, _) => data.high,
                          openValueMapper: (Quotes data, _) => data.open,
                          closeValueMapper: (Quotes data, _) => data.close,
                        ),
                      ]),
                  Container(
                    color: const Color.fromARGB(132, 15, 15, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        getOptionData('1D', true),
                        getOptionData('1S', false),
                        getOptionData('1M', false),
                        getOptionData('1A', false),
                        getOptionData('5A', false),
                        getOptionData('Max', false),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  Widget getOptionData(String option, bool active) {
    return Expanded(
      child: SizedBox(
        height: 30,
        // width: 30,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => print('click'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Icon(item.iconData,
                //     color: color, size: widget.iconSize),
                Text(
                  option,
                  style: TextStyle(
                      color: active
                          ? Color.fromARGB(255, 56, 180, 104)
                          : Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
