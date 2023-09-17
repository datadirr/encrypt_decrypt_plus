#ifndef FLUTTER_PLUGIN_ENCRYPT_DECRYPT_PLUS_PLUGIN_H_
#define FLUTTER_PLUGIN_ENCRYPT_DECRYPT_PLUS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace encrypt_decrypt_plus {

class EncryptDecryptPlusPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  EncryptDecryptPlusPlugin();

  virtual ~EncryptDecryptPlusPlugin();

  // Disallow copy and assign.
  EncryptDecryptPlusPlugin(const EncryptDecryptPlusPlugin&) = delete;
  EncryptDecryptPlusPlugin& operator=(const EncryptDecryptPlusPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace encrypt_decrypt_plus

#endif  // FLUTTER_PLUGIN_ENCRYPT_DECRYPT_PLUS_PLUGIN_H_
