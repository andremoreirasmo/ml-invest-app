import 'package:ml_invest_app/shared/utils/date_util.dart';

class LastTrendRefresh {
  DateTime? date;

  LastTrendRefresh({this.date});

  LastTrendRefresh.fromJson(Map<String, dynamic> json) {
    date = DateUtil.dateFromUTCZero(json["date"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["date"] = date;
    return _data;
  }
}
