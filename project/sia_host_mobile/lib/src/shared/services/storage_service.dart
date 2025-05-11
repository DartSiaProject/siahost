import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sia_host_mobile/src/modules/auth/data/models/user_info.dart';
import 'package:sia_host_mobile/src/shared/security/data_decrypter.dart';

@Singleton()
class StorageService {
  /// Initialize the local database service
  /// This method is called after the service is created.
  /// It initializes the FlutterSecureStorage instance.
  @PostConstruct(preResolve: true)
  Future<void> init() async {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
    _currentUser = null;

    // Initialize shared preferences
    _prefs = await SharedPreferences.getInstance();
  }

  // secure storage
  late FlutterSecureStorage _storage;
  FlutterSecureStorage get i => _storage;

  // shared preferences
  late SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;

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

  /// This return the current user data encrypted
  ///
  UserInfo decryptUserString(String userString) {
    final user = UserInfo.fromEncodedJson(userString);
    return UserInfo(
      serverAddress: DataDecrypter.decrypt(
        encryptedData: user.serverAddress,
      ),
      key: DataDecrypter.decrypt(
        encryptedData: user.key,
      ),
      iv: DataDecrypter.decrypt(encryptedData: user.iv),
      email: user.email,
      password: user.password,
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

  Future<String?> getUserString() async {
    try {
      return _storage.read(key: 'userData');
    } catch (e) {
      return null;
    }
  }

  /// Onboarding
  Future<bool> getOnboarding() => _storage.containsKey(key: 'onboarding');
  Future<void> setOnboarding() =>
      _storage.write(key: 'onboarding', value: 'true');
}
