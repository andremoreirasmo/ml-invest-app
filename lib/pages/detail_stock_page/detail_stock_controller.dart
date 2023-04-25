import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/services/stock_service.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock_enum.dart';

class DetailStockController extends GetxController {
  final StockService _stockService = StockService();
  Rx<StockModel> stock = Rx<StockModel>(StockModel());
  Rx<StockModel> chartStock = Rx<StockModel>(StockModel());
  var isDataLoading = true.obs;
  var isChartLoading = false.obs;
  var selectedPeriod = ChartPeriodEnum.oneDay.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    selectedPeriod.listen((period) => _findChart(period));
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  find(StockModel stockToFind) async {
    try {
      isDataLoading(true);

      stock.value = stockToFind;
      stock.value = await _stockService.findOne(
          stockToFind.id as int, selectedPeriod.value) as StockModel;
    } finally {
      isDataLoading(false);
    }
  }

  _findChart(ChartPeriodEnum period) async {
    isChartLoading(true);

    try {
      var chart = await _stockService.findChart(stock.value.ticker!, period);

      stock.value.chart = chart;
      stock.refresh();
    } finally {
      isChartLoading(false);
    }
  }

  @override
  void onClose() {}
}
