import 'package:ml_invest_app/shared/errors/error_handler.dart';
import 'package:ml_invest_app/shared/models/http_client_enum.dart';
import 'package:ml_invest_app/shared/models/user_model.dart';
import 'package:ml_invest_app/shared/services/api_url.dart';
import 'package:ml_invest_app/shared/services/http_client.dart';

class UserService {
  final HttpClient _http = HttpClient();
  static String url = "${ApiUrl.url}/user";

  Future<UserModel?> getUser(String authToken) async {
    try {
      dynamic response =
          await _http.request(HttpRequestEnum.get, url, authToken: authToken);

      return UserModel.fromJson(response);
    } catch (error) {
      ErrorHandler.handleError(error);
      return null;
    }
  }

  Future<void> deleteUser(String authToken) async {
    try {
      await _http.request(HttpRequestEnum.delete, url, authToken: authToken);
    } catch (error) {
      ErrorHandler.handleError(error);
    }
  }

  Future<bool> createUser(String name, String email, String password) async {
    try {
      String uri = "$url/signup";
      await _http.request(HttpRequestEnum.post, uri,
          body: {'name': name, 'email': email, 'password': password});

      return true;
    } catch (error) {
      ErrorHandler.handleError(error);
      return false;
    }
  }
}
