import 'package:get/get.dart';
import 'package:ml_invest_app/pages/history_page/history_controller.dart';
import 'package:ml_invest_app/pages/home/home_controller.dart';
import 'package:ml_invest_app/shared/controllers/Init_controller.dart';
import 'package:ml_invest_app/shared/controllers/login_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(InitController(), permanent: true);
    Get.put(HistoryController(), permanent: true);
  }
}
