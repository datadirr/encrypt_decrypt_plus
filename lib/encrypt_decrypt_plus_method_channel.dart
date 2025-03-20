import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'encrypt_decrypt_plus_platform_interface.dart';

/// An implementation of [EncryptDecryptPlusPlatform] that uses method channels.
class MethodChannelEncryptDecryptPlus extends EncryptDecryptPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('encrypt_decrypt_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
