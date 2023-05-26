import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/utils/date_util.dart';

class StockComparisonModel {
  String? id;
  DateTime? createdAt;
  List<StockModel>? stocks;

  StockComparisonModel({this.id, this.createdAt, this.stocks});

  StockComparisonModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = DateUtil.dateFromUTCZero(json["createdAt"]);
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
