import 'dart:convert';

import 'package:encrypt/encrypt.dart';

/// This class is responsible for decrypting data.
///
class DataDecrypter {
  // The constructor is private to prevent instantiation.
  DataDecrypter._();

  /// Decrypts the given [encryptedData] using base64 decoding.
  ///
  /// This method takes a base64 encoded string and
  /// decodes it to its original form.
  ///
  static String decrypt({
    required String encryptedData,
  }) {
    final bytes = base64.decode(encryptedData);
    final decrypted = utf8.decode(bytes);
    return decrypted;
  }

  /// Decrypts the given [chipherText] using AES-256-CBC algorithm.
  ///
  static String decryptStringWithAES256CBC({
    required String chipherText,
    required String key,
    required String iv,
  }) {
    final decrypter = Encrypter(
      AES(
        Key.fromUtf8(key),
        mode: AESMode.cbc,
      ),
    );

    final decrypted = decrypter.decrypt(
      Encrypted.from64(chipherText),
      iv: IV.fromUtf8(iv),
    );

    return decrypted;
  }

  /// Decrypts the given [chipherText] using AES-256-CBC algorithm
  /// and returns the decrypted bytes.
  ///
  static List<int> decryptBytesWithAES256CBC({
    required String chipherText,
    required String key,
    required String iv,
  }) {
    final decrypter = Encrypter(
      AES(
        Key.fromUtf8(key),
        mode: AESMode.cbc,
      ),
    );

    final decrypted = decrypter.decryptBytes(
      Encrypted.from64(chipherText),
      iv: IV.fromUtf8(iv),
    );

    return decrypted;
  }
}
