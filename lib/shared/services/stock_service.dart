import 'package:ml_invest_app/shared/errors/error_handler.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/services/api_url.dart';
import 'package:ml_invest_app/shared/services/http_client.dart';

class StockService {
  late HttpClient _http;

  StockService() {
    _http = HttpClient();
  }

  static String url = "${ApiUrl.url}/stock";

  Future<List<StockModel>> getAllStocks() async {
    try {
      List<dynamic> response = await _http.get(url);

      var list = response.map((e) => StockModel.fromJson(e)).toList();

      return list;
    } catch (error) {
      ErrorHandler.handleError(error);
      return [];
    }
  }

  Future<StockModel?> findOne(int id) async {
    try {
      String uri = "$url/$id";
      dynamic response = await _http.get(uri);

      return StockModel.fromJson(response);
    } catch (error) {
      ErrorHandler.handleError(error);
      return null;
    }
  }
}
