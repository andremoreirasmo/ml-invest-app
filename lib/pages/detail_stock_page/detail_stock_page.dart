import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/pages/detail_stock_page/detail_stock_controller.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/utils/number_util.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock.dart';
import 'package:ml_invest_app/shared/widgets/default_app_bar.dart';
import 'package:ml_invest_app/shared/widgets/ticker_stock/ticker_stock.dart';
import 'package:skeletons/skeletons.dart';

class DetailStockPage extends StatelessWidget {
  final DetailStockController controller = Get.put(DetailStockController());

  DetailStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Obx(() => Row(children: [
              TickerStock(title: controller.stock.value.ticker!),
              Text(
                controller.stock.value.name!,
                style: const TextStyle(fontSize: 14),
              ),
            ])),
      ),
      body: RefreshIndicator(
          onRefresh: () => controller.find(),
          child: Obx(() => Skeleton(
                isLoading: controller.isDataLoading.value,
                skeleton: const Center(child: CircularProgressIndicator()),
                child: WidgetUtil.showIf(
                    !controller.isDataLoading.value,
                    () => ListView(
                          children: [
                            _getPriceInfo(),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            // _getTabs()
                          ],
                        )),
              ))),
    );
  }

  Widget _getPriceInfo() {
    Price price = controller.stock.value.summary!.price!;
    String regularMarketChange =
        NumberUtil.formatValue(price.regularMarketChange);
    String regularMarketChangePercent =
        NumberUtil.formatValue(price.regularMarketChangePercent);

    return Container(
        padding: const EdgeInsets.all(15),
        color: const Color.fromRGBO(97, 97, 97, 1),
        height: 85,
        child: Row(children: [
          CircleAvatar(
            radius: 25,
            backgroundImage:
                NetworkImage(controller.stock.value.image as String),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            NumberUtil.formatCurrency(price?.regularMarketPrice),
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$regularMarketChange ($regularMarketChangePercent%)",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ],
          ))
        ]));
  }

  Widget _getTabs() {
    return Row(
      children: [
        TabBar(controller: controller.tabController, tabs: [
          Tab(child: Text("Geral")),
          Tab(child: Text("Tab 2")),
        ]),
        IndexedStack(
          index: controller.tabController.index,
          children: [
            Container(height: 50, color: Colors.grey),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: const Text(
                      "Fechamento anterior",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      NumberUtil.formatValue(controller
                          .stock.value.summary?.summaryDetail?.previousClose),
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
