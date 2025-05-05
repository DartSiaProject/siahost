import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/auth/data/models/user_info.dart';
import 'package:sia_host_mobile/src/shared/security/data_decrypter.dart';

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
    _currentUser = null;
  }

  late FlutterSecureStorage _storage;
  FlutterSecureStorage get i => _storage;

  UserInfo? _currentUser;

  /// This return the current user data decrypted
  ///
  /// Only the [key], [iv] and [serverAddress] are decrypted
  /// since they are needed for interacting with renterd package
  ///
  UserInfo? get currentUserDecrypted {
    if (_currentUser == null) return null;

    return UserInfo(
      serverAddress: DataDecrypter.decrypt(
        encryptedData: _currentUser!.serverAddress,
      ),
      key: DataDecrypter.decrypt(
        encryptedData: _currentUser!.key,
      ),
      iv: DataDecrypter.decrypt(encryptedData: _currentUser!.iv),
      email: _currentUser!.email,
      password: _currentUser!.password,
    );
  }

  /// User
  Future<void> saveUser(UserInfo user) async {
    _currentUser = user;
    final userStringified = user.toEncodedJson();
    await _storage.write(key: 'userData', value: userStringified);
  }

  Future<UserInfo?> getUser() async {
    try {
      final userData = await _storage.read(key: 'userData');
      if (userData != null) {
        final user = UserInfo.fromEncodedJson(userData);
        _currentUser = user;
        return user;
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
