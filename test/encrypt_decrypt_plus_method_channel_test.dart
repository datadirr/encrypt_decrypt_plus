import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:encrypt_decrypt_plus/encrypt_decrypt_plus_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelEncryptDecryptPlus platform = MethodChannelEncryptDecryptPlus();
  const MethodChannel channel = MethodChannel('encrypt_decrypt_plus');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
