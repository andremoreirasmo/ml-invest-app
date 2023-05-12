import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/pages/home/home_controller.dart';
import 'package:ml_invest_app/pages/home/widgets/stocks_by_trend/skeleton_stocks_by_trend.dart';
import 'package:ml_invest_app/pages/home/widgets/stocks_by_trend/stocks_by_trend.dart';
import 'package:ml_invest_app/shared/models/trend_stock_enum.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:skeletons/skeletons.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        edgeOffset: 260,
        onRefresh: () => homeController.fethData(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 250.0,
              backgroundColor: const Color.fromRGBO(97, 97, 97, 1),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: const EdgeInsets.all(15),
                title: const Text('ML Invest'),
                background: Container(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Image(
                        image:
                            AssetImage('assets/images/undraw_robotics_kep.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() {
              return SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Skeleton(
                    themeMode: ThemeMode.dark,
                    isLoading: homeController.isDataLoading.value,
                    skeleton: Column(
                        children: WidgetUtil.getWidgets(
                            3, () => const SkeletonStocksByTrend())),
                    child: Container(
                      color: const Color.fromRGBO(48, 48, 48, 1),
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: TrendStockEnum.values
                              .where((type) => homeController.stocksByTrend
                                  .containsKey(type))
                              .map((type) => StocksByTrend(
                                    type: type,
                                    stocks: homeController.stocksByTrend[type],
                                  ))
                              .toList()),
                    ),
                  ),
                ]),
              );
            }),
          ],
        ),
      ),
    );
  }
}
