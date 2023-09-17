#include "include/encrypt_decrypt_plus/encrypt_decrypt_plus_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "encrypt_decrypt_plus_plugin.h"

void EncryptDecryptPlusPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  encrypt_decrypt_plus::EncryptDecryptPlusPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
