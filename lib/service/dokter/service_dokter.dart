import 'dart:convert';
import 'dart:math';

import 'package:flutter_application_myskin/shared/helper/token_helper.dart';
import 'package:flutter_application_myskin/shared/url_helper.dart';
import 'package:http/http.dart' as http;

class APIServiceDokter {
  String baseUrl = UrlStaging.url;

  Future<http.Response> loginDokter(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/api/login/dokter'),
        headers: {"Content-Type": "application/json", "Accept": "*/*"},
        body: jsonEncode({"email": email, "password": password}));
    try {
      return response;
    } catch (e) {
      return response;
    }
  }

  Future<http.Response> logOutDokter() async {
    final TokenHelper _tokenHelper = TokenHelper();
    String token = await _tokenHelper.getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/api/logout/dokter'),
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

  Future<http.Response> getAllDokter() async {
    final TokenHelper _tokenHelper = TokenHelper();
    String token = await _tokenHelper.getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/api/get/all/dokter'),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        "Authorization": "Bearer $token",
        "Charset": "utf-8"
      },
    );
    print(token);
    try {
      return response;
    } catch (e) {
      return response;
    }
  }

  Future<http.Response> changePasswordDokter(
    String oldPassword,
    String newPassword,
    String confirmationPassword,
  ) async {
    final TokenHelper _tokenHelper = TokenHelper();
    String token = await _tokenHelper.getToken();
    final response =
        await http.post(Uri.parse('$baseUrl/api/pasien/change-password'),
            headers: {
              "Content-Type": "application/json",
              "Accept": "*/*",
              "Authorization": "Bearer $token"
            },
            body: jsonEncode({
              'old_password': oldPassword,
              'password': newPassword,
              'confirmation_password': confirmationPassword,
            }));

    try {
      return response;
    } catch (e) {
      return response;
    }
  }

  Future<http.Response> getDokter() async {
    final TokenHelper _tokenHelper = TokenHelper();
    String token = await _tokenHelper.getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/api/get/dokter'),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        "Authorization": "Bearer $token",
        "Charset": "utf-8"
      },
    );
    print(token);
    try {
      return response;
    } catch (e) {
      return response;
    }
  }

  Future<http.Response> updateStatusKonsultasi(
    String statusKonsultasi,
    int id,
  ) async {
    final TokenHelper _tokenHelper = TokenHelper();
    String token = await _tokenHelper.getToken();
    final response =
        await http.post(Uri.parse('$baseUrl/api/consults/update/$id'),
            headers: {
              "Content-Type": "application/json",
              "Accept": "*/*",
              "Authorization": "Bearer $token"
            },
            body: jsonEncode({
              "status_konsultasi": statusKonsultasi,
            }));
    print(response.body);
    try {
      return response;
    } catch (e) {
      return response;
    }
  }

  Future<http.Response> updateDiagnosaLanjut(
      String diagnosaLanjut, int id) async {
    final TokenHelper _tokenHelper = TokenHelper();
    String token = await _tokenHelper.getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/api/consults/update/$id'),
      headers: {
        "Content-Type": "application/json",
        "Accept": "*/*",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(
        {
          "daignosa_lanjut": diagnosaLanjut,
        },
      ),
    );
    print(response.body);
    try {
      return response;
    } catch (e) {
      return response;
    }
  }

  Future<http.Response> getConsultsDokter() async {
    final TokenHelper _tokenHelper = TokenHelper();
    String token = await _tokenHelper.getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/api/consults/dokter'),
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        "Authorization": "Bearer $token",
        "Charset": "utf-8"
      },
    );
    print(token);
    try {
      return response;
    } catch (e) {
      return response;
    }
  }
}
