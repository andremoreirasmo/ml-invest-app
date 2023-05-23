class UserModel {
  String? accessToken;
  String? id;
  String? email;
  String? name;
  String? password;

  UserModel({this.accessToken, this.id, this.email, this.name, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    id = json["id"];
    email = json["email"];
    name = json["name"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["access_token"] = accessToken;
    _data["id"] = id;
    _data["email"] = email;
    _data["name"] = name;
    _data["password"] = password;
    return _data;
  }
}
