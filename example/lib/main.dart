import 'package:encrypt_decrypt_plus/cipher/cipher.dart';
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
  String _encryptTxt = "";
  String _decryptTxt = "";
  final Cipher _cipher = Cipher(secretKey: "datadirr");

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
                      _encrypt();
                    },
                    child: const Text("Encrypt")),
                Text("encryptTxt: $_encryptTxt"),
                ElevatedButton(
                    onPressed: () {
                      _decrypt();
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

  void _encrypt() async {
    _encryptTxt = _cipher.xorEncode(_plainTxt);
    setState(() {});
  }

  void _decrypt() async {
    _decryptTxt = _cipher.xorDecode(_encryptTxt);
    setState(() {});
  }
}
