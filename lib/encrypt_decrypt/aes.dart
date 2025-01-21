import 'dart:convert';
import 'dart:developer';
import 'package:encrypt/encrypt.dart' as aes;

/// encryption and decryption using AES
class AES {
  /// [secretKey] 32 character long
  String secretKey;

  /// [iv] 16 character long
  String iv;

  /// [padding] default 0, any character
  String padding;

  late aes.Key _secretKey;
  late aes.IV _iv;

  AES({required this.secretKey, required this.iv, this.padding = "0"}) {
    try {
      String secretKey32Bytes =
          secretKey.padRight(32, padding).substring(0, 32);
      String iv16Bytes = iv.padRight(16, padding).substring(0, 16);
      _secretKey = aes.Key.fromUtf8(secretKey32Bytes);
      _iv = aes.IV.fromUtf8(iv16Bytes);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String?> encryptAES256CBC(dynamic data) async {
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

  Future<dynamic> decryptAES256CBC(String encryptedData) async {
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
