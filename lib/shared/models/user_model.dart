import 'package:ml_invest_app/shared/utils/date_util.dart';

class UserModel {
  String? accessToken;
  String? id;
  String? email;
  String? name;
  DateTime? createdAt;

  UserModel({this.accessToken, this.id, this.email, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    id = json["id"];
    email = json["email"];
    name = json["name"];
    createdAt = DateUtil.dateFromUTCZero(json["createdAt"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["access_token"] = accessToken;
    _data["id"] = id;
    _data["email"] = email;
    _data["name"] = name;
    _data["createdAt"] = createdAt;
    return _data;
  }
}
