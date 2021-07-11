import 'dart:convert';

class UserModel {
  final String name;
  final String? photo;

  UserModel({required this.name, this.photo});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], photo: map['photo']);
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));
  Map<String, dynamic> toMap() => {"name": name, "photo": photo};

  String toJson() => jsonEncode(toMap());
}
