import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ml_invest_app/shared/errors/error_handler.dart';
import 'package:ml_invest_app/shared/models/http_client_enum.dart';
import 'package:ml_invest_app/shared/models/stock_comparison_model.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/models/user_model.dart';
import 'package:ml_invest_app/shared/services/api_url.dart';
import 'package:ml_invest_app/shared/services/http_client.dart';

class StockComparisonService {
  final HttpClient _http = HttpClient();
  final Rx<UserModel?> user;
  static String url = "${ApiUrl.url}/stock-comparison";
  String get authToken => user.value!.accessToken!;

  StockComparisonService(this.user);

  Future<List<StockComparisonModel>?> findAll() async {
    try {
      List<dynamic> response =
          await _http.request(HttpRequestEnum.get, url, authToken: authToken);

      return response.map((e) => StockComparisonModel.fromJson(e)).toList();
    } catch (error) {
      ErrorHandler.handleError(error);
      return null;
    }
  }

  Future<StockComparisonModel?> save(List<StockModel> stocks) async {
    try {
      dynamic response = await _http.request(HttpRequestEnum.post, url,
          authToken: authToken,
          body: {"stocks": stocks.map((e) => e.id!).toList()});

      return StockComparisonModel.fromJson(response);
    } catch (error) {
      ErrorHandler.handleError(error);
      return null;
    }
  }

  Future<bool> delete(StockComparisonModel comparison) async {
    try {
      String uri = "$url/${comparison.id!}";

      await _http.request(HttpRequestEnum.delete, uri, authToken: authToken);
      return true;
    } catch (error) {
      ErrorHandler.handleError(error);
      return false;
    }
  }
}
