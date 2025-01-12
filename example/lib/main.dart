import 'package:encrypt_decrypt_plus/encrypt_decrypt/aes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _plainTxt = "Hello datadirr";
  String? _encryptTxt = "";
  String? _decryptTxt = "";
  final AES _aes = AES(
      secretKey: "datadirrdatadirrdatadirrdatadirr", iv: "datadirrdatadirr");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("plainTxt: $_plainTxt"),
                ElevatedButton(
                    onPressed: () {
                      _encryptAES256CBC();
                    },
                    child: const Text("Encrypt")),
                Text("encryptTxt: $_encryptTxt"),
                ElevatedButton(
                    onPressed: () {
                      _decryptAES256CBC();
                    },
                    child: const Text("Decrypt")),
                Text("decryptTxt: $_decryptTxt"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _encryptAES256CBC() async {
    _encryptTxt = _aes.encryptAES256CBC(_plainTxt);
    setState(() {});
  }

  void _decryptAES256CBC() async {
    _decryptTxt = _aes.decryptAES256CBC(_encryptTxt ?? "");
    setState(() {});
  }
}
