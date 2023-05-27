import 'package:get/get.dart';
import 'package:ml_invest_app/shared/controllers/login_controller.dart';
import 'package:ml_invest_app/shared/models/user_model.dart';
import 'package:ml_invest_app/shared/services/user_service.dart';

class AccountController extends GetxController {
  final LoginController _loginController = Get.find();
  final UserService _userService = UserService();

  UserModel get user => _loginController.user.value!;

  deleteUser() async {
    await _userService.deleteUser(_loginController.user.value!.accessToken!);
    _loginController.logout();
  }

  logout() {
    _loginController.logout();
  }
}
