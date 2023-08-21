import 'package:encrypt/encrypt.dart';

class EncrypterHelper {
  static String encrypt({required String data}) {
    var key = Key.fromLength(32);
    var iv = IV.fromLength(8);
    var encrypter = Encrypter(Salsa20(key));
    var encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted.base64;
  }

  static String decrypt({required String dataEncrypted}) {
    var encrypted = Encrypted.from64(dataEncrypted);
    var key = Key.fromLength(32);
    var iv = IV.fromLength(8);
    var encrypter = Encrypter(Salsa20(key));
    var decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}
