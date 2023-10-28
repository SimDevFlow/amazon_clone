import 'dart:convert';

class User {
  final String id;
  final String email;
  final String password;
  final String name;
  final String address;
  final String type;
  final String token;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.address,
    required this.type,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());
  factory User.fromJson(String source) => User.fromMap(jsonDecode(source));
}
