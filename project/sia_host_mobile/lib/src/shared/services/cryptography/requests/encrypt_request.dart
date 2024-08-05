// import 'package:cryptography/cryptography.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:sia_host_mobile/src/shared/services/cryptography/configs/crypto_instance.dart';

class EncryptRequest {
  static String encryptStringWithAES256CBC(String data) {
    var encrypter = Encrypter(AES(
      keyAesCbc,
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
    var encrypted = encrypter.encrypt(data, iv: ivAesCbc);
    return encrypted.base64.toString();
  }

  static String encryptBytesWithAES256CBC(Uint8List data) {
    var encrypter = Encrypter(AES(
      keyAesCbc,
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
    var encrypted = encrypter.encryptBytes(data, iv: ivAesCbc);
    return encrypted.base64.toString();
  }

  static String hashWithSHA256(dynamic data) {
    var _bytes = utf8.encode(data);
    var _digest = sha256.convert(_bytes);
    return _digest.toString();
  }
}
