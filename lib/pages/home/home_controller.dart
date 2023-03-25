import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/services/stock_service.dart';

class HomeController extends GetxController {
  final StockService _stockService = StockService();
  List<StockModel>? stocks;

  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fethData();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  fethData() async {
    try {
      isDataLoading(true);

      stocks = await _stockService.getAllStocks();
    } finally {
      isDataLoading(false);
    }
  }
}
