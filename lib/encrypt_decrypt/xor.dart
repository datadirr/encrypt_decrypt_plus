import 'dart:convert';

/// encryption and decryption using XOR
class XOR {
  /// [secretKey] set key for encryption and decryption
  String? secretKey;

  XOR({this.secretKey});

  /// xor encryption & decryption using the secret key
  List<int> _xor(List<int> bytes, List<int> keys) {
    return bytes.map((e) => e ^ keys[bytes.length % keys.length]).toList();
  }

  /// bytes encryption, without a secret key just xor with its next byte
  List<int> _encrypt(List<int> bytes) {
    var encrypted = <int>[...bytes];
    var length = encrypted.length;
    for (var i = 0; i < length; i++) {
      var j = (i + 1 >= length) ? 0 : i + 1;
      encrypted[i] = encrypted[i] ^ encrypted[j];
    }
    return encrypted;
  }

  /// bytes decryption, without a secret key just xor with its next byte
  List<int> _decrypt(List<int> bytes) {
    var decrypted = <int>[...bytes];
    var length = decrypted.length;
    for (var i = length - 1; i >= 0; i--) {
      var j = (i + 1 >= length) ? 0 : i + 1;
      decrypted[i] = decrypted[i] ^ decrypted[j];
    }
    return decrypted;
  }

  /// string xor encryption
  String xorEncode(String content, {String? secretKey}) {
    this.secretKey = secretKey ?? this.secretKey;
    if (this.secretKey != null && this.secretKey!.isNotEmpty) {
      return base64Encode(
          _xor(utf8.encode(content), utf8.encode(this.secretKey!)));
    } else {
      return base64Encode(_encrypt(utf8.encode(content)));
    }
  }

  /// string xor decryption
  String xorDecode(String content, {String? secretKey}) {
    this.secretKey = secretKey ?? this.secretKey;
    if (this.secretKey != null && this.secretKey!.isNotEmpty) {
      return utf8
          .decode(_xor(base64Decode(content), utf8.encode(this.secretKey!)));
    } else {
      return utf8.decode(_decrypt(base64Decode(content)));
    }
  }

  /// bytes xor encryption
  List<int> xorEncodeBytes(List<int> bytes, {String? secretKey}) {
    this.secretKey = secretKey ?? this.secretKey;
    if (this.secretKey != null && this.secretKey!.isNotEmpty) {
      return _xor(bytes, utf8.encode(this.secretKey!));
    } else {
      return _encrypt(bytes);
    }
  }

  /// bytes xor decryption
  List<int> xorDecodeBytes(List<int> bytes, {String? secretKey}) {
    this.secretKey = secretKey ?? this.secretKey;
    if (this.secretKey != null && this.secretKey!.isNotEmpty) {
      return _xor(bytes, utf8.encode(this.secretKey!));
    } else {
      return _decrypt(bytes);
    }
  }

  /// bytes to string xor encryption
  String xorEncodeBytesToString(List<int> bytes, {String? secretKey}) {
    this.secretKey = secretKey ?? this.secretKey;
    if (this.secretKey != null && this.secretKey!.isNotEmpty) {
      return base64Encode(_xor(bytes, utf8.encode(this.secretKey!)));
    } else {
      return base64Encode(_encrypt(bytes));
    }
  }

  /// bytes to string xor decryption
  List<int> xorDecodeStringToBytes(String content, {String? secretKey}) {
    this.secretKey = secretKey ?? this.secretKey;
    if (this.secretKey != null && this.secretKey!.isNotEmpty) {
      return _xor(base64Decode(content), utf8.encode(this.secretKey!));
    } else {
      return _decrypt(base64Decode(content));
    }
  }

  /// string to bytes xor encryption
  List<int> xorEncodeStringToBytes(String content, {String? secretKey}) {
    this.secretKey = secretKey ?? this.secretKey;
    if (this.secretKey != null && this.secretKey!.isNotEmpty) {
      return _xor(utf8.encode(content), utf8.encode(this.secretKey!));
    } else {
      return _encrypt(utf8.encode(content));
    }
  }

  /// string to bytes xor decryption
  String xorDecodeBytesToString(List<int> bytes, {String? secretKey}) {
    this.secretKey = secretKey ?? this.secretKey;
    if (this.secretKey != null && this.secretKey!.isNotEmpty) {
      return utf8.decode(_xor(bytes, utf8.encode(this.secretKey!)));
    } else {
      return utf8.decode(_decrypt(bytes));
    }
  }
}
