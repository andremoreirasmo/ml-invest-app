import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ml_invest_app/shared/models/user_model.dart';
import 'package:ml_invest_app/shared/services/login_service.dart';
import 'package:ml_invest_app/shared/services/user_service.dart';

class LoginController extends GetxController {
  final _box = GetStorage();
  final LoginService _loginService = LoginService();
  final UserService _userService = UserService();
  final Rx<UserModel?> user = null.obs;

  @override
  Future<void> onReady() async {
    super.onReady();
    verifyIfIsLoggedIn();
  }

  Future<bool> login(String username, String password) async {
    var loggedUser = await _loginService.login(username, password);

    var loggedIn = loggedUser != null;

    if (loggedIn) {
      _box.write('access_token', loggedUser.accessToken);
      user(loggedUser);
    }

    return loggedIn;
  }

  verifyIfIsLoggedIn() async {
    String? token = _box.read('access_token');

    if (token != null) {
      var loggedUser = await _userService.getUser(token);

      if (loggedUser != null) {
        loggedUser.accessToken = token;
        user(loggedUser);
      }
    }
  }
}
