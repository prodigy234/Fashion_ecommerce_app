import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> login({required String email, required String password}) async {
    String url = 'https://reqres.in/api/login';

    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    debugPrint(body.toString());

    var response = await http.post(Uri.parse(url), body: body);

    debugPrint(response.statusCode.toString());

    final data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      return data;
    } else {
      print(response.body);
      print(response.statusCode);
    }
  }
}
