import 'package:get/get.dart';
import 'package:ml_invest_app/pages/home/home_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
