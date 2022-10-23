import 'dart:convert';
import 'dart:math';

import 'package:flutter_application_myskin/shared/helper/token_helper.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<http.Response> loginProcess(String email, String password) async {
    final response = await http.post(
        Uri.parse('https://cf4f-103-156-164-7.ap.ngrok.io/api/login'),
        headers: {"Content-Type": "application/json", "Accept": "*/*"},
        body: jsonEncode({"email": email, "password": password}));
    try {
      return response;
    } catch (e) {
      return response;
    }
  }

  Future<http.Response> logOut() async {
    final TokenHelper _tokenHelper = TokenHelper();
    String token = await _tokenHelper.getToken();
    final response = await http.post(
      Uri.parse('https://cf4f-103-156-164-7.ap.ngrok.io/api/logout'),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        "Authorization": "Bearer $token"
      },
    );
    try {
      return response;
    } catch (e) {
      return response;
    }
  }
}
