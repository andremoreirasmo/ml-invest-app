import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ml_invest_app/shared/widgets/default_app_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../shared/widgets/ticker_stock/ticker_stock.dart';

class DetailStockPage extends StatefulWidget {
  const DetailStockPage({super.key});

  @override
  State<DetailStockPage> createState() => _DetailStockPageState();
}

class _DetailStockPageState extends State<DetailStockPage> {
  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Row(children: [
          TickerStock(title: "AMER3"),
          Text(
            "AMERICANAS ON NM",
            style: TextStyle(fontSize: 14),
          ),
        ]),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: const Color.fromRGBO(97, 97, 97, 1),
            height: 85,
            child: Row(children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://conteudos.xpi.com.br/wp-content/uploads/2021/07/amer3.jpg?w=400"),
              ),
              const SizedBox(
                width: 20,
              ),
              const Expanded(
                  child: Text(
                "R\$ 12,64",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "-1,25 (-9,00%)",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ))
            ]),
          ),
          Column(
            children: [
              SfCartesianChart(
                title: ChartTitle(text: 'Yearly sales analysis'),
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries>[
                  LineSeries<SalesData, double>(
                      name: 'Sales',
                      dataSource: _chartData,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true)
                ],
                primaryXAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                ),
                primaryYAxis: NumericAxis(
                    labelFormat: '{value}M',
                    numberFormat:
                        NumberFormat.simpleCurrency(decimalDigits: 0)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/high.png'),
                height: 42,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Tendência de alta",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 18),
      SalesData(2021, 30)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
