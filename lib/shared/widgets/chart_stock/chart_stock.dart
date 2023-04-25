import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock_enum.dart';
import 'package:skeletons/skeletons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartStock extends StatelessWidget {
  List<Quotes>? chartData;
  Rx<ChartPeriodEnum> selectedPeriod;
  Rx<bool> isLoading;

  ChartStock(
      {super.key,
      required this.chartData,
      required this.selectedPeriod,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return WidgetUtil.showIf(
        chartData != null,
        () => Container(
              height: 352,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(209, 15, 15, 15),
                borderRadius: BorderRadius.circular(8),
                border:
                    Border.all(color: const Color.fromARGB(132, 15, 15, 15)),
              ),
              child: Obx(() => Skeleton(
                    isLoading: isLoading.value,
                    skeleton: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: Column(
                      children: [
                        SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            backgroundColor:
                                const Color.fromARGB(132, 15, 15, 15),
                            primaryXAxis: DateTimeAxis(
                                edgeLabelPlacement: EdgeLabelPlacement.shift,
                                majorGridLines: const MajorGridLines(width: 0),
                                intervalType:
                                    selectedPeriod.value.chartIntervalType),
                            primaryYAxis: NumericAxis(
                              axisLine: const AxisLine(width: 0),
                              majorTickLines: const MajorTickLines(
                                  color: Colors.transparent),
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: <ChartSeries>[
                              CandleSeries<Quotes, DateTime>(
                                enableSolidCandles: true,
                                name: 'Dados',
                                dataSource: chartData!,
                                xValueMapper: (Quotes data, _) => data.date,
                                lowValueMapper: (Quotes data, _) => data.low,
                                highValueMapper: (Quotes data, _) => data.high,
                                openValueMapper: (Quotes data, _) => data.open,
                                closeValueMapper: (Quotes data, _) =>
                                    data.close,
                              ),
                            ]),
                        Container(
                          color: const Color.fromARGB(132, 15, 15, 15),
                          child: Obx(() => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: ChartPeriodEnum.values
                                    .map((e) => getOptionPeriod(
                                        e, e == selectedPeriod.value))
                                    .toList(),
                              )),
                        )
                      ],
                    ),
                  )),
            ));
  }

  Widget getOptionPeriod(ChartPeriodEnum option, bool active) {
    return Expanded(
      child: SizedBox(
        height: 30,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => selectedPeriod.value = option,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  option.label,
                  style: TextStyle(
                      color: active
                          ? const Color.fromARGB(255, 56, 180, 104)
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
