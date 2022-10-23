import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class EncryptHelper {
  ///Encrypts the given plainText using the key. Returns encrypted data
  static Encrypted encryptWithAES(String key, String plainText) {
    final cipherKey = Key.fromUtf8(key);
    final encryptService = Encrypter(AES(cipherKey, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(key.substring(0,
        16)); //Here the IV is generated from key. This is for example only. Use some other text or random data as IV for better security.
    Encrypted encryptedData = encryptService.encrypt(plainText, iv: initVector);
    return encryptedData;
  }

  ///Accepts encrypted data and decrypt it. Returns plain text
  static String decryptWithAES(String key, Encrypted encryptedData) {
    final cipherKey = Key.fromUtf8(key);
    final encryptService =
        Encrypter(AES(cipherKey, mode: AESMode.cbc)); //Using AES CBC encryption
    final initVector = IV.fromUtf8(key.substring(0,
        16)); //Here the IV is generated from key. This is for example only. Use some other text or random data as IV for better security.

    return encryptService.decrypt(encryptedData, iv: initVector);
  }
}
