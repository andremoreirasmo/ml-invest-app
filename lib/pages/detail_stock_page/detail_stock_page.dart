import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/pages/detail_stock_page/detail_stock_controller.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/utils/number_util.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock.dart';
import 'package:ml_invest_app/shared/widgets/default_app_bar.dart';
import 'package:skeletons/skeletons.dart';

import '../../shared/widgets/ticker_stock/ticker_stock.dart';

class DetailStockPage extends StatefulWidget {
  @override
  State<DetailStockPage> createState() => _DetailStockPageState();
}

class _DetailStockPageState extends State<DetailStockPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DetailStockController controller = Get.put(DetailStockController());

  @override
  void initState() {
    controller.find(Get.arguments);
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Price? price = controller.stock.value.summary?.price;
      String regularMarketChange =
          NumberUtil.formatValue(price?.regularMarketChange);
      String regularMarketChangePercent =
          NumberUtil.formatValue(price?.regularMarketChangePercent);

      return Scaffold(
        appBar: DefaultAppBar(
          title: Row(children: [
            TickerStock(title: controller.stock.value.ticker as String),
            Text(
              controller.stock.value.name as String,
              style: TextStyle(fontSize: 14),
            ),
          ]),
        ),
        body: RefreshIndicator(
            onRefresh: () => controller.find(Get.arguments),
            child: Skeleton(
              isLoading: controller.isDataLoading.value,
              skeleton: Center(child: CircularProgressIndicator()),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          color: const Color.fromRGBO(97, 97, 97, 1),
                          height: 85,
                          child: Row(children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  controller.stock.value.image as String),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Text(
                              NumberUtil.formatCurrency(
                                  price?.regularMarketPrice),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "$regularMarketChange ($regularMarketChangePercent%)",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                              ],
                            ))
                          ]),
                        ),
                        ChartStock(
                            chartData: controller.stock.value.chart?.quotes,
                            selectedPeriod: controller.selectedPeriod,
                            isLoading: controller.isChartLoading),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: TabBar(controller: _tabController, tabs: [
                      Tab(child: Text("Tab 1")),
                      Tab(child: Text("Tab 2")),
                    ]),
                  ),
                  SliverFillRemaining(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Container(height: 5000, color: Colors.amberAccent),
                        Container(height: 5000),
                      ],
                    ),
                  )
                ],
              ),
            )),
      );
    });
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