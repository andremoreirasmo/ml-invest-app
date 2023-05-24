class UserModel {
  String? accessToken;
  String? id;
  String? email;
  String? name;

  UserModel({this.accessToken, this.id, this.email, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    id = json["id"];
    email = json["email"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["access_token"] = accessToken;
    _data["id"] = id;
    _data["email"] = email;
    _data["name"] = name;
    return _data;
  }
}
