import 'package:shared_preferences/shared_preferences.dart';

import '../enums/shared_preference_enum.dart';

class SharedPreferenceRequest {
  static Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  static Future<void> writeData({
    required String key,
    required Map<String, dynamic> data,
    required Preferences preferences,
  }) async {
    switch (preferences) {
      case Preferences.stringType:
        (await _sharedPreferences).setString(key, data["value"]);
        break;
      case Preferences.boolType:
        (await _sharedPreferences).setBool(key, data["value"]);
        break;
      case Preferences.intType:
        (await _sharedPreferences).setInt(key, data["value"]);
      case Preferences.doubleType:
        (await _sharedPreferences).setDouble(key, data["value"]);
        break;
      case Preferences.stringListType:
        (await _sharedPreferences).setStringList(key, data["value"]);
        break;
    }
  }

  static Future<Map<String, dynamic>> fetchData({
    required String key,
    required Preferences preferences,
  }) async {
    if ((await _sharedPreferences).containsKey(key)) {
      switch (preferences) {
        case Preferences.stringType:
          return {
            "status": true,
            "data": (await _sharedPreferences).getString(key)!,
          };

        case Preferences.boolType:
          return {
            "status": true,
            "data": (await _sharedPreferences).getBool(key)!,
          };

        case Preferences.intType:
          return {
            "status": true,
            "data": (await _sharedPreferences).getInt(key)!,
          };

        case Preferences.doubleType:
          return {
            "status": true,
            "data": (await _sharedPreferences).getDouble(key)!,
          };

        case Preferences.stringListType:
          return {
            "status": true,
            "data": (await _sharedPreferences).getStringList(key)!,
          };
      }
    } else {
      return {
        "status": false,
      };
    }
  }

  static Future<Map<String, dynamic>> clearData({
    required String key,
  }) async {
    return (await _sharedPreferences).remove(key).then(
          (value) => {
            "status": true,
          },
        );
  }
}
