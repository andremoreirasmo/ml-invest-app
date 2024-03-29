import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/pages/home/home_controller.dart';
import 'package:ml_invest_app/pages/select_compare_stock_page/select_compare_stock_controller.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:ml_invest_app/shared/widgets/default_app_bar.dart';
import 'package:ml_invest_app/shared/widgets/ticker_stock/ticker_stock.dart';

class SelectCompareStockPage extends StatelessWidget {
  SelectCompareStockPage({super.key});

  final SelectCompareStockController controller =
      Get.put(SelectCompareStockController());

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Row(children: const [
          Text(
            "Comparar ações",
            style: TextStyle(fontSize: 14),
          ),
        ]),
      ),
      body: WidgetUtil.showLoading(
        homeController.isDataLoading.value,
        () => ListView.builder(
            itemCount: homeController.stocks.length,
            itemBuilder: ((context, index) {
              var stock = homeController.stocks[index];

              return Obx(() => Column(
                    children: [
                      CheckboxListTile(
                        title: Row(
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
                            TickerStock(title: stock.ticker!),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  stock.name as String,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                        value: controller.selectedStocks.contains(stock),
                        onChanged: (value) {
                          if (value != null && value) {
                            controller.selectedStocks.add(stock);
                          } else {
                            controller.selectedStocks.remove(stock);
                          }
                        },
                      ),
                      WidgetUtil.showIf(
                          stock == homeController.stocks.last,
                          () => const SizedBox(
                                height: 80,
                              ))
                    ],
                  ));
            })),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Obx(() => WidgetUtil.showIf(
          controller.selectedStocks.length > 1,
          () => FloatingActionButton(
              onPressed: () => controller.compareStocks(),
              tooltip: 'Comparar',
              elevation: 2.0,
              backgroundColor: const Color.fromRGBO(84, 84, 84, 1),
              child: const Icon(
                Icons.send,
                color: AppColors.green,
              )))),
    );
  }
}
