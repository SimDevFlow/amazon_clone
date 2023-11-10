import 'dart:convert';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/utils.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //signup User
  void signupUser({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      User user = User(
        id: '',
        email: email,
        password: password,
        name: name,
        address: '',
        type: '',
        token: '',
      );

      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account created! Now login');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //signin the user
  void signinUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
