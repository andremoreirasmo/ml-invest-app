import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/services/stock_service.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock_enum.dart';

class CompareStockController extends GetxController {
  final StockService _stockService = StockService();

  var stocks = <StockModel>[].obs;
  var isDataLoading = true.obs;
  var isChartLoading = false.obs;
  var selectedPeriod = ChartPeriodEnum.oneDay.obs;
  List<String> tickersStocks = [];

  @override
  Future<void> onInit() async {
    super.onInit();

    selectedPeriod.listen((period) => _findChart(period));
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    stocks(Get.arguments);
    tickersStocks = stocks.map((e) => e.ticker!).toList();
    fetchData();
  }

  fetchData() async {
    isDataLoading(true);

    var list = await _stockService.find(tickersStocks, selectedPeriod.value);

    stocks(list ?? <StockModel>[]);
    isDataLoading(false);
  }

  _findChart(ChartPeriodEnum period) async {
    isChartLoading(true);

    List<StockModel>? charts =
        await _stockService.findChart(tickersStocks, selectedPeriod.value);
    if (charts != null) {
      var mapCharts = Map.fromEntries(
          charts.map((stock) => MapEntry(stock.ticker!, stock)));

      for (var stock in stocks) {
        stock.chart = mapCharts[stock.ticker!]!.chart;
      }

      stocks.refresh();
    }

    isChartLoading(false);
  }

  @override
  void onClose() {}
}
