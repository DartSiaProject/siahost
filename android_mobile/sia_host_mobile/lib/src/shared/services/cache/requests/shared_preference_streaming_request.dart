import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../enums/shared_preference_enum.dart';

class SharedPreferenceStreamRequest {
  static Future<StreamingSharedPreferences> _sharedPreferencesStream =
      StreamingSharedPreferences.instance;

  static Future<void> writeData({
    required String key,
    required Map<String, dynamic> data,
    required Preferences preferences,
  }) async {
    switch (preferences) {
      case Preferences.stringType:
        (await _sharedPreferencesStream).setString(key, data["value"]);
        break;
      case Preferences.boolType:
        (await _sharedPreferencesStream).setBool(key, data["value"]);
        break;
      case Preferences.intType:
        (await _sharedPreferencesStream).setInt(key, data["value"]);
      case Preferences.doubleType:
        (await _sharedPreferencesStream).setDouble(key, data["value"]);
        break;
      case Preferences.stringListType:
        (await _sharedPreferencesStream).setStringList(key, data["value"]);
        break;
    }
  }

  static Stream<Map<String, dynamic>> fetchData({
    required String key,
    required Preferences preferences,
    required Map<String, dynamic> data,
  }) async* {
    switch (preferences) {
      case Preferences.stringType:
        yield* (await _sharedPreferencesStream)
            .getString(key, defaultValue: data["defaultValue"])
            .map((dataEvent) => {
                  "data": dataEvent,
                });

      case Preferences.boolType:
        yield* (await _sharedPreferencesStream)
            .getBool(key, defaultValue: data["defaultValue"])
            .map((dataEvent) => {
                  "data": dataEvent,
                });

      case Preferences.intType:
        yield* (await _sharedPreferencesStream)
            .getInt(key, defaultValue: data["defaultValue"])
            .map((dataEvent) => {
                  "data": dataEvent,
                });

      case Preferences.doubleType:
        yield* (await _sharedPreferencesStream)
            .getDouble(key, defaultValue: data["defaultValue"])
            .map((dataEvent) => {
                  "data": dataEvent,
                });

      case Preferences.stringListType:
        yield* (await _sharedPreferencesStream)
            .getStringList(key, defaultValue: data["defaultValue"])
            .map((dataEvent) => {
                  "data": dataEvent,
                });
    }
  }

  static Future<void> clearData({
    required String key,
  }) async {
    (await _sharedPreferencesStream).remove(key);
  }
}
