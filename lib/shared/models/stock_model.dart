class StockModel {
  int? id;
  String? name;
  String? image;
  String? ticker;
  int? stockStatus;

  StockModel({this.id, this.name, this.image, this.ticker, this.stockStatus});

  StockModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["ticker"] is String) {
      ticker = json["ticker"];
    }
    if (json["stockStatus"] is int) {
      stockStatus = json["stockStatus"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["ticker"] = ticker;
    _data["stockStatus"] = stockStatus;
    return _data;
  }
}
