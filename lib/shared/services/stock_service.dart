import 'package:ml_invest_app/shared/errors/error_handler.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/services/api_url.dart';
import 'package:ml_invest_app/shared/services/http_client.dart';

class StockService {
  late HttpClient _http;

  StockService() {
    _http = HttpClient();
  }

  static String baseUri = '/stock';

  Future<List<StockModel>?> getAllStocks() async {
    var url = "${ApiUrl.url}$baseUri";

    try {
      await Future<void>.delayed(const Duration(milliseconds: 1000));
      List<dynamic> response = await _http.get(url);

      var list = response.map((e) => StockModel.fromJson(e)).toList();

      return list;
    } catch (error) {
      ErrorHandler.handleError(error);
      return null;
    }
  }
}
