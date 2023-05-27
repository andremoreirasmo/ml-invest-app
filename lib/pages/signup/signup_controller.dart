import 'package:get/get.dart';
import 'package:ml_invest_app/shared/controllers/login_controller.dart';
import 'package:ml_invest_app/shared/services/user_service.dart';

class SignupController extends GetxController {
  final LoginController _loginController = Get.find();
  final UserService _userService = UserService();
  final isLoading = false.obs;

  signUp(String name, String email, String password) async {
    isLoading(true);

    try {
      var created = await _userService.createUser(name, email, password);
      if (!created) {
        return;
      }

      var logged = await _loginController.login(email, password);
      if (!logged) {
        //Return to login page
        Get.back();
        return;
      }

      //Return to previous page before go to Login page
      Get.close(2);
    } finally {
      isLoading(false);
    }
  }
}
