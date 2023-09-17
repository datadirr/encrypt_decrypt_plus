import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'encrypt_decrypt_plus_method_channel.dart';

abstract class EncryptDecryptPlusPlatform extends PlatformInterface {
  /// Constructs a EncryptDecryptPlusPlatform.
  EncryptDecryptPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static EncryptDecryptPlusPlatform _instance =
      MethodChannelEncryptDecryptPlus();

  /// The default instance of [EncryptDecryptPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelEncryptDecryptPlus].
  static EncryptDecryptPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EncryptDecryptPlusPlatform] when
  /// they register themselves.
  static set instance(EncryptDecryptPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
