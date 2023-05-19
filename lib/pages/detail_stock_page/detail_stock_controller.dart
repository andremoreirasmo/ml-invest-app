import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/services/stock_service.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock_enum.dart';

class DetailStockController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final StockService _stockService = StockService();
  late TabController tabController;
  var selectedTab = 0.obs;

  Rx<StockModel> stock = Rx<StockModel>(StockModel(name: "", ticker: ""));
  var isDataLoading = true.obs;
  var isChartLoading = false.obs;
  var selectedPeriod = ChartPeriodEnum.oneDay.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    tabController = TabController(length: 2, vsync: this);
    selectedPeriod.listen((period) => _findChart(period));
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    stock(Get.arguments);
    find();
  }

  find() async {
    isDataLoading(true);

    stock.value =
        (await _stockService.findOne(stock.value.id!, selectedPeriod.value))!;
    isDataLoading(false);
  }

  _findChart(ChartPeriodEnum period) async {
    isChartLoading(true);

    var chart = await _stockService.findChart(stock.value.ticker!, period);

    stock.value.chart = chart;
    stock.refresh();
    isChartLoading(false);
  }

  @override
  void onClose() {
    tabController.dispose();
  }
}
