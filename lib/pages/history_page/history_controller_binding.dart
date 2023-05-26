import 'package:get/get.dart';
import 'package:ml_invest_app/pages/history_page/history_controller.dart';

class HistoryControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HistoryController>(HistoryController(), permanent: true);
  }
}
