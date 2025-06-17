import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/modules/auth/data/models/dto/login_dto.dart';
import 'package:sia_host_mobile/src/modules/auth/data/models/user_info.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/security/data_encrypter.dart';
import 'package:sia_host_mobile/src/shared/services/api_client.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';

@LazySingleton()
class AuthRepository {
  AuthRepository(this._api, this._stoage);

  final ApiClient _api;
  final StorageService _stoage;

  /// Check if user is authenticated
  ///
  /// Check if user is authenticated by checking if its data is stored in
  /// secure local storage.
  Future<bool> isAuthenticated() async {
    final user = await _stoage.getUser();
    return user != null;
  }

  /// Login
  ///
  Future<void> login(LoginDto dto) async {
    try {
      final url = '${dto.serverAddress}/auth/login';
      await _api.post(
        url,
        data: {
          'email': dto.email,
          'password': dto.password,
        },
      );

      final userKeys = Crypto.generateTheKey(
        mailAndPassword: dto.email + dto.password,
      );
      final encryptedUserInfo = UserInfo(
        serverAddress: DataEncrypter.encrypt(data: dto.serverAddress),
        email: DataEncrypter.encrypt(data: dto.email),
        password: DataEncrypter.encrypt(data: dto.password),
        key: DataEncrypter.encrypt(data: userKeys['key'] as String),
        iv: DataEncrypter.encrypt(data: userKeys['iv'] as String),
      );

      // save user data secure storage
      await _stoage.saveUser(encryptedUserInfo);

      return;
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }
}
