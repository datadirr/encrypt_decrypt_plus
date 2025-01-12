import 'dart:convert';
import 'package:encrypt/encrypt.dart' as aes;

/// AES for encryption & decryption
class AES {
  /// [secretKey] 32 character long
  String secretKey;

  /// [iv] 16 character long
  String iv;

  late aes.Key _secretKey;
  late aes.IV _iv;

  AES({required this.secretKey, required this.iv}) {
    _secretKey = aes.Key.fromUtf8(secretKey);
    _iv = aes.IV.fromUtf8(iv);
  }

  String encryptAES256CBC(dynamic data) {
    String encodedData = jsonEncode(data);
    final encrypter = aes.Encrypter(aes.AES(_secretKey, mode: aes.AESMode.cbc));
    final encrypted = encrypter.encrypt(encodedData, iv: _iv);
    return encrypted.base64;
  }

  dynamic decryptAES256CBC(String encryptedData) {
    final encrypter = aes.Encrypter(aes.AES(_secretKey, mode: aes.AESMode.cbc));
    final decrypted =
        encrypter.decrypt(aes.Encrypted.fromBase64(encryptedData), iv: _iv);
    return jsonDecode(decrypted);
  }
}
