import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signupUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(id: '', email: email, password: password, name: name, address: '', type: '', token: '');
      http.post(Uri.parse('$uri/api/signup'));
    } catch (e) {}
  }
}
