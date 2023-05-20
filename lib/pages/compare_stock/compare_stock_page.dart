import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/pages/compare_stock/compare_stock_controller.dart';
import 'package:ml_invest_app/shared/models/home_page_enum.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock.dart';
import 'package:ml_invest_app/shared/widgets/default_app_bar.dart';

class CompareStockPage extends StatelessWidget {
  final CompareStockController controller = Get.put(CompareStockController());

  CompareStockPage({super.key});

  List<StockModel> selectedStocks = Get.arguments;

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.offAllNamed(Routes.home,
              arguments: HomePageEnum.history.index),
        ),
      ),
      body: Obx(() => WidgetUtil.showLoading(
          controller.isDataLoading.value,
          () => ListView(
                children: [
                  ChartStock(
                      chartData: controller.stocks,
                      selectedPeriod: controller.selectedPeriod,
                      isLoading: controller.isChartLoading),
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
                ],
              ))),
    );
  }
}
