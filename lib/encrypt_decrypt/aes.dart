import 'dart:convert';
import 'dart:developer';
import 'package:encrypt/encrypt.dart' as aes;

/// encryption and decryption using AES
class AES {
  /// [secretKey] 32 character long
  String secretKey;

  /// [iv] 16 character long
  String iv;

  late aes.Key _secretKey;
  late aes.IV _iv;

  AES({required this.secretKey, required this.iv}) {
    try {
      _secretKey = aes.Key.fromUtf8(secretKey);
      _iv = aes.IV.fromUtf8(iv);
    } catch (e) {
      log(e.toString());
    }
  }

  String? encryptAES256CBC(dynamic data) {
    try {
      if (data == null) {
        return null;
      }
      String encodedData = jsonEncode(data);
      final encrypter =
          aes.Encrypter(aes.AES(_secretKey, mode: aes.AESMode.cbc));
      final encrypted = encrypter.encrypt(encodedData, iv: _iv);
      return encrypted.base64;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  dynamic decryptAES256CBC(String encryptedData) {
    try {
      if (encryptedData.trim().isEmpty) {
        return null;
      }
      final encrypter =
          aes.Encrypter(aes.AES(_secretKey, mode: aes.AESMode.cbc));
      final decrypted =
          encrypter.decrypt(aes.Encrypted.fromBase64(encryptedData), iv: _iv);
      return jsonDecode(decrypted);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
