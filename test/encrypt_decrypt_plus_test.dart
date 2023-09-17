import 'package:flutter_test/flutter_test.dart';
import 'package:encrypt_decrypt_plus/encrypt_decrypt_plus.dart';
import 'package:encrypt_decrypt_plus/encrypt_decrypt_plus_platform_interface.dart';
import 'package:encrypt_decrypt_plus/encrypt_decrypt_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEncryptDecryptPlusPlatform
    with MockPlatformInterfaceMixin
    implements EncryptDecryptPlusPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EncryptDecryptPlusPlatform initialPlatform =
      EncryptDecryptPlusPlatform.instance;

  test('$MethodChannelEncryptDecryptPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEncryptDecryptPlus>());
  });

  test('getPlatformVersion', () async {
    EncryptDecryptPlus encryptDecryptPlusPlugin = EncryptDecryptPlus();
    MockEncryptDecryptPlusPlatform fakePlatform =
        MockEncryptDecryptPlusPlatform();
    EncryptDecryptPlusPlatform.instance = fakePlatform;

    expect(await encryptDecryptPlusPlugin.getPlatformVersion(), '42');
  });
}
