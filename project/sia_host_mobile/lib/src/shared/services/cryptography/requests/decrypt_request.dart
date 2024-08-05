import 'dart:convert';

import 'package:encrypt/encrypt.dart';

import '../configs/crypto_instance.dart';

class DecryptRequest {
  static dynamic decryptWithAES256CBC(
    String chipherText,
  ) {
    var _decrypter = Encrypter(AES(
      keyAesCbc,
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
    var _decrypted =
        _decrypter.decryptBytes(Encrypted.from64(chipherText), iv: ivAesCbc);
    var _decryptedString = utf8.decode(_decrypted);

    return _decryptedString.runtimeType is String
        ? _decryptedString.toString()
        : _decryptedString;
  }

  // static String decryptWithSHA256(String encryptedData) {
  //   var _bytes = encryptedData.codeUnits;

  //   var _data = hex.encode(digest.bytes);
  //   return _data;
  // }
}
