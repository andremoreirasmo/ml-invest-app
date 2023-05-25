import 'package:ml_invest_app/shared/models/stock_model.dart';

class StockComparisonModel {
  String? createdAt;
  List<StockModel>? stocks;

  StockComparisonModel({this.createdAt, this.stocks});

  StockComparisonModel.fromJson(Map<String, dynamic> json) {
    createdAt = json["createdAt"];
    stocks = json["stocks"] == null
        ? null
        : (json["stocks"] as List).map((e) => StockModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["createdAt"] = createdAt;
    if (stocks != null) {
      _data["stocks"] = stocks?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
