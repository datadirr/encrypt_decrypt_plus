[<img src="https://datadirr.com/datadirr.png" width="200" />](https://datadirr.com)


# encrypt_decrypt_plus

This package helps to encryption and decryption with or without secret key.

## Using

For help getting started with Flutter, view our
[online documentation](https://pub.dev/documentation/encrypt_decrypt_plus/latest), which offers tutorials,
samples, guidance on mobile and web development, and a full API reference.

## Installation

First, add `encrypt_decrypt_plus` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

In your flutter project add the dependency:

```yml
dependencies:
  ...
  encrypt_decrypt_plus:
```

For help getting started with Flutter, view the online
[documentation](https://flutter.io/).

## Example

Please follow this [example](https://github.com/datadirr/encrypt_decrypt_plus/tree/master/example) here.


### AES Encryption and Decryption

* AES-256-CBC
```dart
AES aes = AES(secretKey: "datadirr", iv: "datadirr");
String encryptTxt = aes.encryptAES256CBC("Hello datadirr");
String decryptTxt = aes.decryptAES256CBC(encryptTxt);
```


### XOR Encryption and Decryption

1. With Secret Key

* Method 1
```dart
XOR xor = XOR(secretKey: "datadirr");
String encryptTxt = xor.xorEncode("Hello datadirr");
String decryptTxt = xor.xorDecode(encryptTxt);
```

* Method 2
```dart
XOR xor = XOR();
String encryptTxt = xor.xorEncode("Hello datadirr", secretKey: "datadirr");
String decryptTxt = xor.xorDecode(encryptTxt, secretKey: "datadirr");
```

* Method 3
```dart
String encryptTxt = XOR().xorEncode("Hello datadirr", secretKey: "datadirr");
String decryptTxt = XOR().xorDecode(encryptTxt, secretKey: "datadirr");
```

* Method 4
```dart
String encryptTxt = XOR(secretKey: "datadirr").xorEncode("Hello datadirr");
String decryptTxt = XOR(secretKey: "datadirr").xorDecode(encryptTxt);
```


1. Without Secret Key

* Method 1
```dart
XOR xor = XOR();
String encryptTxt = xor.xorEncode("Hello datadirr");
String decryptTxt = xor.xorDecode(encryptTxt);
```

* Method 2
```dart
String encryptTxt = XOR().xorEncode("Hello datadirr");
String decryptTxt = XOR().xorDecode(encryptTxt);
```


### JWT token decode
```dart
JWT.decode("jwt_token");
```