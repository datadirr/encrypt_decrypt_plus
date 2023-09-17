#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint encrypt_decrypt_plus.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'encrypt_decrypt_plus'
  s.version          = '0.0.1'
  s.summary          = 'This package helps to encryption and decryption with secret key and without secret key.'
  s.description      = <<-DESC
This package helps to encryption and decryption with secret key and without secret key.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
