import 'package:ml_invest_app/shared/errors/error_handler.dart';
import 'package:ml_invest_app/shared/errors/models/app_exceptions.dart';
import 'package:ml_invest_app/shared/models/http_client_enum.dart';
import 'package:ml_invest_app/shared/models/user_model.dart';
import 'package:ml_invest_app/shared/services/api_url.dart';
import 'package:ml_invest_app/shared/services/http_client.dart';
import 'package:ml_invest_app/shared/utils/snackbar_util.dart';

class LoginService {
  final HttpClient _http = HttpClient();
  static String url = "${ApiUrl.url}/auth/login";

  Future<UserModel?> login(String email, String password) async {
    try {
      dynamic response = await _http.request(HttpRequestEnum.post, url,
          body: {'username': email, 'password': password});

      return UserModel.fromJson(response);
    } catch (error) {
      if (error is UnauthorizedException) {
        SnackbarUtil.showSnackbar(
            SnackbarEnum.alert, 'Atenção', 'Email ou senha inválidos');
      } else {
        ErrorHandler.handleError(error);
      }
      return null;
    }
  }
}
