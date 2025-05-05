import 'dart:convert';

/// This class is responsible for encrypting data.
///
class DataEncrypter {
  // The constructor is private to prevent instantiation.
  DataEncrypter._();

  /// Encrypts the given [data] using base64 encoding.
  ///
  static String encrypt({
    required String data,
  }) {
    final bytes = utf8.encode(data);
    final encrypted = base64.encode(bytes);
    return encrypted;
  }
}
