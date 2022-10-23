import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'encrypt_helper.dart';
import 'secret_key_helper.dart';

class TokenHelper {
  //secret key boleh dimodifikasi
  final String _secretKey = SecretKeyHelper.tokenSecretKey; //harus 32 karakter

  //proses simpan token
  void saveToken(String token) async {
    print('token is $token');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  //proses ambil token
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      String result = EncryptHelper.decryptWithAES(
          _secretKey, EncryptHelper.encryptWithAES(_secretKey, token));
      return result;
    } else {
      return '';
    }
  }
}
