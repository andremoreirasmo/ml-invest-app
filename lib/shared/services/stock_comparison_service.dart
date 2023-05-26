import 'package:ml_invest_app/shared/errors/error_handler.dart';
import 'package:ml_invest_app/shared/models/http_client_enum.dart';
import 'package:ml_invest_app/shared/models/stock_comparison_model.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/services/api_url.dart';
import 'package:ml_invest_app/shared/services/http_client.dart';

class StockComparisonService {
  final HttpClient _http = HttpClient();
  String authToken;
  static String url = "${ApiUrl.url}/stock-comparison";

  StockComparisonService(this.authToken);

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

  Future<void> save(List<StockModel> stocks) async {
    try {
      await _http.request(HttpRequestEnum.post, url,
          authToken: authToken,
          body: {"stocks": stocks.map((e) => e.id!).toList()});
    } catch (error) {
      ErrorHandler.handleError(error);
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
