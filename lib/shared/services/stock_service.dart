import 'package:ml_invest_app/shared/errors/error_handler.dart';
import 'package:ml_invest_app/shared/models/http_client_enum.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/models/trend_stock_model.dart';
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
      List<dynamic> response = await _http.request(HttpRequestEnum.get, url);

      var list = response.map((e) => StockModel.fromJson(e)).toList();

      return list;
    } catch (error) {
      ErrorHandler.handleError(error);
      return [];
    }
  }

  Future<dynamic> find(dynamic tickers, ChartPeriodEnum period) async {
    try {
      String uri = "$url/find";
      dynamic response = await _http.request(HttpRequestEnum.get, uri,
          queryParams: {'ticker': tickers, 'period': period.queryParam});

      if (tickers is List<String>) {
        List<dynamic> stocks = response;

        List<StockModel> result =
            stocks.map((e) => StockModel.fromJson(e)).toList();
        return result;
      }

      return StockModel.fromJson(response);
    } catch (error) {
      ErrorHandler.handleError(error);
      return null;
    }
  }

  Future<dynamic> findChart(dynamic tickers, ChartPeriodEnum period) async {
    try {
      String uri = "$url/chart";
      List<dynamic> response = await _http.request(HttpRequestEnum.get, uri,
          queryParams: {'ticker': tickers, 'period': period.queryParam});

      if (tickers is List<String>) {
        return response.map((e) => StockModel.fromJson(e)).toList();
      }

      return response.map((e) => StockChartModel.fromJson(e)).toList();
    } catch (error) {
      ErrorHandler.handleError(error);
      return null;
    }
  }

  Future<LastTrendRefresh?> getLastRefreshTrend() async {
    try {
      String uri = "$url/trend/lastRefresh";
      dynamic response = await _http.request(HttpRequestEnum.get, uri);

      return LastTrendRefresh.fromJson(response);
    } catch (error) {
      ErrorHandler.handleError(error);
      return null;
    }
  }
}
