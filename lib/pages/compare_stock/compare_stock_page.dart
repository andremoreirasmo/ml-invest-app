import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/pages/compare_stock/compare_stock_controller.dart';
import 'package:ml_invest_app/shared/models/home_page_enum.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/models/trend_stock_enum.dart';
import 'package:ml_invest_app/shared/utils/number_util.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock.dart';
import 'package:ml_invest_app/shared/widgets/default_app_bar.dart';
import 'package:ml_invest_app/shared/widgets/price_variation.dart';

class CompareStockPage extends StatelessWidget {
  final CompareStockController controller = Get.put(CompareStockController());

  CompareStockPage({super.key});

  final List<StockModel> selectedStocks = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var tickersStocks = selectedStocks.map((e) => e.ticker).join(', ');

    return Scaffold(
      appBar: DefaultAppBar(
        title: Row(children: [
          Expanded(
            child: Text(
              tickersStocks,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ]),
      ),
      body: WillPopScope(
        onWillPop: () async {
          await Get.offAllNamed(Routes.home,
              arguments: HomePageEnum.history.index);

          return true;
        },
        child: RefreshIndicator(
          onRefresh: () => controller.fetchData(),
          child: Obx(() => WidgetUtil.showLoading(
              controller.isDataLoading.value,
              () => ListView(
                    children: [
                      ChartStock(
                          chartData: controller.stocks,
                          selectedPeriod: controller.selectedPeriod,
                          isLoading: controller.isChartLoading),
                      Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.grey[800],
                        child: const Text("Tendência das ações",
                            style: TextStyle(color: Colors.grey)),
                      ),
                      Column(
                        children: controller.stocks
                            .map((stock) => Column(
                                  children: [
                                    _getStock(stock),
                                    WidgetUtil.showIf(
                                      stock != controller.stocks.last,
                                      () => Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: Colors.grey[600],
                                        endIndent: 15,
                                        indent: 15,
                                      ),
                                    )
                                  ],
                                ))
                            .toList(),
                      )
                    ],
                  ))),
        ),
      ),
    );
  }

  Widget _getStock(StockModel stock) {
    return SizedBox(
      height: 60,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => Get.toNamed(Routes.detailStock, arguments: stock),
          child: Container(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: SvgPicture.network(
                      stock.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          stock.ticker!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          stock.name!,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Icon(stock.trend!.icon,
                            color: stock.trend!.color, size: 30),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            NumberUtil.formatCurrency(stock
                                .summary!.price!.regularMarketPrice!
                                .toDouble()),
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          PriceVariation(
                            regularMarketChange:
                                stock.summary!.price!.regularMarketChange!,
                            regularMarketChangePercent: stock
                                .summary!.price!.regularMarketChangePercent!,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
