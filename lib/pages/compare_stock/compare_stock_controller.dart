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

  @override
  Future<void> onInit() async {
    super.onInit();

    selectedPeriod.listen((period) => _findChart(period));
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    stocks(Get.arguments);
    fetchData();
  }

  fetchData() async {
    isDataLoading(true);

    var values = await Future.wait(stocks.map(
        (stock) => _stockService.findOne(stock.id!, selectedPeriod.value)));

    var list = values
        .where((element) => element != null)
        .map((element) => element as StockModel)
        .toList();

    stocks(list);
    isDataLoading(false);
  }

  _findChart(ChartPeriodEnum period) async {
    isChartLoading(true);

    await Future.wait(stocks.map((stock) async {
      stock.chart =
          await _stockService.findChart(stock.ticker!, selectedPeriod.value);
    }));

    stocks.refresh();
    isChartLoading(false);
  }

  @override
  void onClose() {}
}
