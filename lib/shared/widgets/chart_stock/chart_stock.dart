import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock_enum.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartStock extends StatelessWidget {
  final dynamic chartData;
  final Rx<ChartPeriodEnum> selectedPeriod;
  final Rx<bool> isLoading;

  const ChartStock(
      {super.key,
      required this.chartData,
      required this.selectedPeriod,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 352,
      width: double.maxFinite,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.black),
      ),
      child: Obx(() => WidgetUtil.showLoading(
            isLoading.value,
            () => Column(
              children: [
                SfCartesianChart(
                  legend: Legend(
                      isVisible: chartData is List<StockModel>,
                      position: LegendPosition.bottom),
                  plotAreaBorderWidth: 0,
                  backgroundColor: AppColors.black,
                  primaryXAxis: DateTimeAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    majorGridLines: const MajorGridLines(width: 0),
                    intervalType: selectedPeriod.value.chartIntervalType,
                  ),
                  primaryYAxis: NumericAxis(
                    axisLine: const AxisLine(width: 0),
                    majorTickLines:
                        const MajorTickLines(color: Colors.transparent),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: _getSeries(),
                ),
                Container(
                  color: AppColors.black,
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: ChartPeriodEnum.values
                            .map((e) =>
                                _getOptionPeriod(e, e == selectedPeriod.value))
                            .toList(),
                      )),
                )
              ],
            ),
          )),
    );
  }

  Widget _getOptionPeriod(ChartPeriodEnum option, bool active) {
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

  List<ChartSeries> _getSeries() {
    if (chartData is List<StockChartModel>) {
      return [
        CandleSeries<StockChartModel, DateTime>(
          enableSolidCandles: true,
          name: 'Dados',
          dataSource: chartData!,
          xValueMapper: (StockChartModel data, _) => data.date,
          lowValueMapper: (StockChartModel data, _) => data.low,
          highValueMapper: (StockChartModel data, _) => data.high,
          openValueMapper: (StockChartModel data, _) => data.open,
          closeValueMapper: (StockChartModel data, _) => data.close,
        )
      ];
    }

    List<StockModel> stocks = chartData;

    return stocks
        .map((stock) => LineSeries<StockChartModel, DateTime>(
            dataSource: stock.chart!,
            name: stock.ticker!,
            xValueMapper: (StockChartModel data, _) => data.date,
            yValueMapper: (StockChartModel data, _) => data.close))
        .toList();
  }
}
