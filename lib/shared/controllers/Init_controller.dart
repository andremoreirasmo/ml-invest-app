import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ml_invest_app/pages/home/home_controller.dart';
import 'package:ml_invest_app/shared/controllers/login_controller.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';
import 'package:ml_invest_app/shared/utils/snackbar_util.dart';

class InitController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await GetStorage.init();
    HomeController homeController = Get.find();
    LoginController loginController = Get.find();

    List<Future<dynamic>> futures = [];

    futures.add(homeController.fetchData());
    futures.add(loginController.loadUser());

    SnackbarUtil.showSnackbar(
        SnackbarEnum.info,
        "Nosso servidor está iniciando...",
        "A primeira requisição pode levar um tempo, pedimos um pouco de paciência.",
        duration: const Duration(minutes: 1));
    // Wait for all the futures to complete
    await Future.wait(futures);
    Get.closeCurrentSnackbar();

    Get.offNamed(Routes.home);
  }
}
