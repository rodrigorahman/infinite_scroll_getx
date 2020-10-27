import 'dart:convert';


class UserModel {
  
  String id;
  String name;
  String username;
  
  UserModel({
    this.id,
    this.name,
    this.username,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
