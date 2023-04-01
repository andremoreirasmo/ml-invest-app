import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';

class SelectCompareStockController extends GetxController {
  RxList<StockModel> selectedStocks = <StockModel>[].obs;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}
}
