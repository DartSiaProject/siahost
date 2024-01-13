import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRequest {
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static Future<void> writeData({
    required String key,
    required String data,
  }) async {
    await secureStorage.write(
      key: key,
      value: data,
    );
  }

  static Future<Map<String, dynamic>> fetchData({
    required String key,
  }) async {
    if (await secureStorage.containsKey(key: key)) {
      return await secureStorage.read(key: key).then(
            (valueData) => {
              "status": true,
              "data": valueData!,
            },
          );
    } else {
      return {
        "status": false,
      };
    }
  }
}
