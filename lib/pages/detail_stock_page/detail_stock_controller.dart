import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/services/stock_service.dart';

class DetailStockController extends GetxController {
  final StockService _stockService = StockService();
  Rx<StockModel> stock = Rx<StockModel>(StockModel());
  var isDataLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  find(StockModel stockToFind) async {
    try {
      isDataLoading(true);

      stock.value = stockToFind;
      stock.value =
          await _stockService.findOne(stockToFind.id as int) as StockModel;
    } finally {
      isDataLoading(false);
    }
  }

  @override
  void onClose() {}
}
