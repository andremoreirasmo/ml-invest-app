import 'package:ml_invest_app/shared/errors/error_handler.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/services/api_url.dart';
import 'package:ml_invest_app/shared/services/http_client.dart';
import 'package:ml_invest_app/shared/widgets/chart_stock/chart_stock_enum.dart';

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

  Future<StockModel?> findOne(int id, ChartPeriodEnum period) async {
    try {
      String uri = "$url/$id";
      dynamic response =
          await _http.get(uri, queryParams: {'period': period.queryParam});

      return StockModel.fromJson(response);
    } catch (error) {
      ErrorHandler.handleError(error);
      return null;
    }
  }

  Future<Chart?> findChart(String ticker, ChartPeriodEnum period) async {
    try {
      String uri = "$url/chart/$ticker";
      dynamic response =
          await _http.get(uri, queryParams: {'period': period.queryParam});

      return Chart.fromJson(response);
    } catch (error) {
      ErrorHandler.handleError(error);
      return null;
    }
  }
}
