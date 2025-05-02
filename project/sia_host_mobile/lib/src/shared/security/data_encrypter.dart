import 'dart:convert';

class DataEncrypter {
  static String encrypt({
    required String data,
  }) {
    final bytes = utf8.encode(data);
    final encrypted = base64.encode(bytes);
    return encrypted;
  }

  static String decrypt({
    required String encryptedData,
  }) {
    final bytes = base64.decode(encryptedData);
    final decrypted = utf8.decode(bytes);
    return decrypted;
  }
}
