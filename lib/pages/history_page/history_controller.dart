import 'package:get/get.dart';
import 'package:ml_invest_app/shared/controllers/login_controller.dart';
import 'package:ml_invest_app/shared/models/stock_comparison_model.dart';
import 'package:ml_invest_app/shared/services/stock_comparison_service.dart';

class HistoryController extends GetxController {
  final LoginController _loginController = Get.find();
  final StockComparisonService _stockComparisonService =
      StockComparisonService("");

  var comparisons = <StockComparisonModel>[].obs;
  var isDataLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    if (_loginController.user != null) {
      _stockComparisonService.authToken =
          _loginController.user.value!.accessToken!;

      fetchData();
    }
  }

  fetchData() async {
    isDataLoading(true);

    var list = await _stockComparisonService.findAll();

    comparisons(list ?? <StockComparisonModel>[]);
    isDataLoading(false);
  }

  delete(StockComparisonModel comparison) async {
    var deleted = await _stockComparisonService.delete(comparison);

    if (deleted) {
      comparisons.remove(comparison);
    }
  }

  @override
  void onClose() {}
}
