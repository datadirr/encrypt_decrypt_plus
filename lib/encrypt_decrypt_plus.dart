import 'encrypt_decrypt_plus_platform_interface.dart';

class EncryptDecryptPlus {
  Future<String?> getPlatformVersion() {
    return EncryptDecryptPlusPlatform.instance.getPlatformVersion();
  }
}
