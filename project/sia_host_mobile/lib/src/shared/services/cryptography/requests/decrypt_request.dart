import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';

class DecryptRequest {
  static String decryptStringWithAES256CBC({
    required String chipherText,
    required String key,
    required String iv,
  }) {
    var _decrypter = Encrypter(AES(
      encrypt.Key.fromUtf8(key),
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
    var _decrypted = _decrypter.decrypt(encrypt.Encrypted.from64(chipherText),
        iv: encrypt.IV.fromUtf8(iv));
    return _decrypted;
  }

  static List<int> decryptBytesWithAES256CBC({
    required String chipherText,
    required String key,
    required String iv,
  }) {
    var _decrypter = Encrypter(AES(
      encrypt.Key.fromUtf8(key),
      mode: AESMode.cbc,
      padding: 'PKCS7',
    ));
    var _decrypted = _decrypter.decryptBytes(
        encrypt.Encrypted.from64(chipherText),
        iv: encrypt.IV.fromUtf8(iv));
    return _decrypted;
  }

  // static String decryptWithSHA256(String encryptedData) {
  //   var _bytes = encryptedData.codeUnits;

  //   var _data = hex.encode(digest.bytes);
  //   return _data;
  // }
}
