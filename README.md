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


### XOR Encryption and Decryption

1. With Secret Key

* Method 1
```dart
Cipher cipher = Cipher(secretKey: "datadirr");
String encryptTxt = cipher.xorEncode("Hello datadirr");
String decryptTxt = cipher.xorDecode(encryptTxt);
```

* Method 2
```dart
Cipher cipher = Cipher();
String encryptTxt = cipher.xorEncode("Hello datadirr", secretKey: "datadirr");
String decryptTxt = cipher.xorDecode(encryptTxt, secretKey: "datadirr");
```

* Method 3
```dart
String encryptTxt = Cipher().xorEncode("Hello datadirr", secretKey: "datadirr");
String decryptTxt = Cipher().xorDecode(encryptTxt, secretKey: "datadirr");
```

* Method 4
```dart
String encryptTxt = Cipher(secretKey: "datadirr").xorEncode("Hello datadirr");
String decryptTxt = Cipher(secretKey: "datadirr").xorDecode(encryptTxt);
```


1. Without Secret Key

* Method 1
```dart
Cipher cipher = Cipher();
String encryptTxt = cipher.xorEncode("Hello datadirr");
String decryptTxt = cipher.xorDecode(encryptTxt);
```

* Method 2
```dart
String encryptTxt = Cipher().xorEncode("Hello datadirr");
String decryptTxt = Cipher().xorDecode(encryptTxt);
```