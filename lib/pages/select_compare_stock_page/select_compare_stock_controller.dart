import 'package:get/get.dart';
import 'package:ml_invest_app/pages/history_page/history_controller.dart';
import 'package:ml_invest_app/shared/controllers/login_controller.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';

class SelectCompareStockController extends GetxController {
  final LoginController _loginController = Get.find();
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

  compareStocks() {
    Get.offAndToNamed(Routes.compareStock, arguments: selectedStocks);

    if (_loginController.user.value != null) {
      HistoryController historyController = Get.find();

      historyController.save(selectedStocks);
    }
  }

  @override
  void onClose() {}
}
