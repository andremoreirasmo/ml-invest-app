import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ml_invest_app/pages/history_page/history_controller.dart';
import 'package:ml_invest_app/shared/models/stock_comparison_model.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:ml_invest_app/shared/widgets/need_login.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController _controller = Get.put(HistoryController());
  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NeedLogin(() => SafeArea(
            child: Obx(() => WidgetUtil.showLoading(
                _controller.isDataLoading.value,
                () => RefreshIndicator(
                      onRefresh: () => _controller.fetchData(),
                      child: ListView(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Últimas ações comparadas",
                                style: TextStyle(
                                    color: Color(0xFFF8F9FA),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Divider(
                                height: 13,
                                thickness: 1,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Obx(() => WidgetUtil.showIf(
                              _controller.comparisons.isNotEmpty,
                              () => Column(
                                children: _controller.comparisons
                                    .map((e) => _getComparison(e))
                                    .toList(),
                              ),
                              elsif: () =>
                                  Lottie.asset("assets/lottie/no-data.json"),
                            )),
                      ]),
                    ))))));
  }

  Widget _getComparison(StockComparisonModel comparison) {
    return SizedBox(
      height: 60,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () =>
              Get.toNamed(Routes.compareStock, arguments: comparison.stocks),
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(Icons.analytics_outlined,
                    color: AppColors.green.withOpacity(0.6), size: 30),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          comparison.stocks!.map((e) => e.ticker).join(', '),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white),
                        ),
                        InkWell(
                            onTap: () => _controller.delete(comparison),
                            child: const Icon(Icons.close,
                                color: Colors.white, size: 15))
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
