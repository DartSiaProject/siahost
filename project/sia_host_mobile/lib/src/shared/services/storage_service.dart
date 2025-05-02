import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/auth/data/models/user_info.dart';

@Singleton()
class StorageService {
  /// Initialize the local database service
  /// This method is called after the service is created.
  /// It initializes the FlutterSecureStorage instance.
  @PostConstruct()
  void init() {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
  }

  late FlutterSecureStorage _storage;
  FlutterSecureStorage get i => _storage;

  /// User
  Future<void> saveUser(UserInfo user) async {
    final userStringified = user.toEncodedJson();
    await _storage.write(key: 'userData', value: userStringified);
  }

  Future<UserInfo?> getUser() async {
    try {
      final user = await _storage.read(key: 'userData');
      if (user != null) {
        return UserInfo.fromEncodedJson(user);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Onboarding
  Future<bool> getOnboarding() => _storage.containsKey(key: 'onboarding');
  Future<void> setOnboarding() =>
      _storage.write(key: 'onboarding', value: 'true');
}
