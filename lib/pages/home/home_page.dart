import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/pages/home/home_controller.dart';
import 'package:ml_invest_app/pages/home/widgets/stocks_by_trend.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController dataController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        edgeOffset: 260,
        onRefresh: () => dataController.fethData(),
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
              return dataController.isDataLoading.value
                  ? const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SliverList(
                      delegate: SliverChildListDelegate.fixed([
                        Container(
                          color: const Color.fromRGBO(48, 48, 48, 1),
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StocksByTrend(
                                title: 'Tendência de alta',
                                stocks: dataController.stocks,
                              ),
                              StocksByTrend(
                                title: 'Neutro',
                                stocks: dataController.stocks,
                              ),
                              StocksByTrend(
                                title: 'Tendência de baixa',
                                stocks: dataController.stocks,
                              ),
                            ],
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
