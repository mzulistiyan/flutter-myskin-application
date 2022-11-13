import 'dart:convert';
import 'dart:math';

import 'package:flutter_application_myskin/shared/helper/token_helper.dart';
import 'package:http/http.dart' as http;

class APIService {
  String baseUrl = 'https://siderplatform.com/testing/myskin-app/public';
  Future<http.Response> loginProcess(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/api/login'),
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
      Uri.parse('$baseUrl/api/logout'),
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

  Future<http.Response> registrasi(
    String email,
    String password,
    String gender,
    String alamat,
    String tanggalLahir,
    String passwordConfirmation,
    String name,
  ) async {
    final response = await http.post(Uri.parse('$baseUrl/api/register'),
        headers: {"Content-Type": "application/json", "Accept": "*/*"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "nama_pasien": name,
          "alamat": alamat,
          "jenis_kelamin": gender,
          "password_confirmation": passwordConfirmation,
          "tanggal_lahir": tanggalLahir,
        }));
    print(response.statusCode);
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

  Future<http.Response> getDataPasien() async {
    final TokenHelper _tokenHelper = TokenHelper();
    String token = await _tokenHelper.getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/api/get/pasien'),
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

  Future<http.Response> updatePasien(
    String namaPasien,
    String jenisKelamin,
    String tanggalLahir,
    String alamat,
  ) async {
    final TokenHelper _tokenHelper = TokenHelper();
    String token = await _tokenHelper.getToken();
    final response = await http.post(Uri.parse('$baseUrl/api/update/pasien'),
        headers: {
          "Content-Type": "application/json",
          "Accept": "*/*",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({
          "nama_pasien": namaPasien,
          "jenis_kelamin": jenisKelamin,
          "tanggal_lahir": tanggalLahir,
          "alamat": alamat,
        }));
    print(response.body);
    try {
      return response;
    } catch (e) {
      return response;
    }
  }

  Future<http.Response> changePassword(
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
}
