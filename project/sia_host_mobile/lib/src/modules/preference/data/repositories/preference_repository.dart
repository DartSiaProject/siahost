import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@Singleton()
class PreferenceRepository {
  PreferenceRepository(this._storage);

  final StorageService _storage;

  Future<Locale?> getCurrentLanguage() async {
    final language = await _storage.i.read(key: 'language');
    if (language == null) {
      return null;
    }
    return Locale(language);
  }

  Future<void> setCurrentLanguage(AppLocales locale) async {
    await _storage.i.write(key: 'language', value: locale.name);
  }
}
