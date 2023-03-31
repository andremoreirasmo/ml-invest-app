class StockModel {
  int? id;
  String? name;
  String? image;
  String? ticker;
  int? stockStatus;
  double? value;

  StockModel(
      {this.id,
      this.name,
      this.image,
      this.ticker,
      this.stockStatus,
      this.value});

  StockModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    ticker = json["ticker"];
    stockStatus = json["stockStatus"];
    value = json["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["ticker"] = ticker;
    _data["stockStatus"] = stockStatus;
    _data["value"] = value;
    return _data;
  }
}
