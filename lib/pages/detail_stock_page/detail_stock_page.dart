import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/pages/detail_stock_page/detail_stock_controller.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/models/trend_stock_enum.dart';
import 'package:ml_invest_app/shared/utils/date_util.dart';
import 'package:ml_invest_app/shared/utils/number_util.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock.dart';
import 'package:ml_invest_app/shared/widgets/default_app_bar.dart';
import 'package:ml_invest_app/shared/widgets/price_variation.dart';
import 'package:ml_invest_app/shared/widgets/ticker_stock/ticker_stock.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailStockPage extends StatelessWidget {
  final DetailStockController controller = Get.put(DetailStockController());

  DetailStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Obx(() => Row(children: [
              TickerStock(title: controller.stock.value.ticker!),
              Expanded(
                child: Text(
                  controller.stock.value.name!,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ])),
      ),
      body: RefreshIndicator(
          onRefresh: () => controller.find(),
          child: Obx(() => WidgetUtil.showLoading(
                controller.isDataLoading.value,
                () => ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => Column(
                          children: [
                            _getPriceInfo(),
                            Obx(() => ChartStock(
                                chartData: controller.stock.value.chart!,
                                selectedPeriod: controller.selectedPeriod,
                                isLoading: controller.isChartLoading)),
                            Container(
                              color: Colors.grey[900],
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(controller.stock.value.trend!.icon,
                                      color:
                                          controller.stock.value.trend!.color,
                                      size: 30),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    controller.stock.value.trend!.description,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            _getTabs()
                          ],
                        )),
              ))),
    );
  }

  Widget _getPriceInfo() {
    Price price = controller.stock.value.summary!.price!;

    return Container(
        padding: const EdgeInsets.all(15),
        color: const Color.fromRGBO(97, 97, 97, 1),
        height: 85,
        child: Row(children: [
          ClipOval(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SvgPicture.network(
                controller.stock.value.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            NumberUtil.formatCurrency(price.regularMarketPrice),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PriceVariation(
                  regularMarketChange: price.regularMarketChange!,
                  regularMarketChangePercent:
                      price.regularMarketChangePercent!),
            ],
          ))
        ]));
  }

  Widget _getTabs() {
    return Column(children: [
      TabBar(
          controller: controller.tabController,
          tabs: const [
            Tab(child: Text("Resumo")),
            Tab(child: Text("Sobre")),
          ],
          onTap: (int tab) => controller.selectedTab(tab)),
      Obx(() => getSelectedTab(controller.selectedTab.value))
    ]);
  }

  Widget getSelectedTab(int tab) {
    switch (tab) {
      case 0:
        return _getOverviewTab();
      case 1:
        return _getAboutTab();
      default:
        return const SizedBox.shrink();
    }
  }

  Container _getOverviewTab() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          _getDetailedInfoStock(
              "Fechamento anterior",
              NumberUtil.formatValue(controller
                  .stock.value.summary?.summaryDetail?.previousClose)),
          _getDetailedInfoStock(
              "Abrir",
              NumberUtil.formatValue(
                  controller.stock.value.summary?.summaryDetail?.open)),
          _getDetailedInfoStock(
              "Preço de compra ",
              NumberUtil.formatValue(
                  controller.stock.value.summary?.summaryDetail?.bid)),
          _getDetailedInfoStock(
              "Preço de venda ",
              NumberUtil.formatValue(
                  controller.stock.value.summary?.summaryDetail?.ask)),
          _getDetailedInfoStock(
              "Volume",
              NumberUtil.formatValue(
                  controller.stock.value.summary?.summaryDetail?.volume)),
          _getDetailedInfoStock(
              "Média volume",
              NumberUtil.formatValue(controller
                  .stock.value.summary?.summaryDetail?.averageVolume)),
          _getDetailedInfoStock(
              "Capitalização de mercado",
              NumberUtil.formatValue(
                  controller.stock.value.summary?.summaryDetail?.marketCap)),
          _getDetailedInfoStock(
              "Beta (mensalmente por 5 anos)",
              NumberUtil.formatValue(
                  controller.stock.value.summary?.summaryDetail?.beta)),
          _getDetailedInfoStock(
              "Data do Ex-Dividendo",
              DateUtil.formatDateInFull(controller.stock.value.summary!
                  .summaryDetail!.exDividendDate!)), // todo
        ],
      ),
    );
  }

  Container _getAboutTab() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Text(controller.stock.value.summary!.quoteType!.longName!,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                    onTap: () => launchUrl(
                        Uri.parse(controller
                            .stock.value.summary!.assetProfile!.website!),
                        mode: LaunchMode.externalApplication),
                    child: Text(
                        controller.stock.value.summary!.assetProfile!.website!,
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)))
              ],
            ),
          ),
          _getDetailedInfoStock("Setor(es)",
              controller.stock.value.summary!.assetProfile!.sector!),
          _getDetailedInfoStock("Indústria",
              controller.stock.value.summary!.assetProfile!.industry!),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    SizedBox(
                      child: Text("Descrição",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            controller.stock.value.summary!.assetProfile!
                                .longBusinessSummary!,
                            style: const TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getDetailedInfoStock(String text, String value) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
        ),
        Divider(
          height: 13,
          thickness: 1,
          color: Colors.grey[600],
        ),
      ],
    );
  }
}
