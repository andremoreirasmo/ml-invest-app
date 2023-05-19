import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/models/trend_stock_enum.dart';
import 'package:ml_invest_app/shared/models/trend_stock_model.dart';
import 'package:ml_invest_app/shared/services/stock_service.dart';

class HomeController extends GetxController {
  final StockService _stockService = StockService();
  List<StockModel> stocks = [];
  Map<String, StockModel> mapStocks = <String, StockModel>{};
  Map<TrendStockEnum, List<StockModel>> stocksByTrend =
      <TrendStockEnum, List<StockModel>>{};
  LastTrendRefresh? lastTrendRefresh;

  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    fethData();
  }

  @override
  void onClose() {}

  fethData() async {
    try {
      isDataLoading(true);

      stocks = await _stockService.getAllStocks();
      mapStocks = Map.fromEntries(
          stocks.map((stock) => MapEntry(stock.ticker!, stock)));
      stocksByTrend = groupBy(stocks, (StockModel stock) => stock.trend!);

      lastTrendRefresh = await _stockService.getLastRefreshTrend();
    } finally {
      isDataLoading(false);
    }
  }
}
