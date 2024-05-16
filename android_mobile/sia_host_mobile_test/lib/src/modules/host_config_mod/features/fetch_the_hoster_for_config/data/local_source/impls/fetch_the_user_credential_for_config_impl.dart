import 'package:injectable/injectable.dart';
import '../../../../../../../shared/constants/envs_const.dart';

import '../../../../../../../shared/services/cache/requests/secure_storage_request.dart';
import '../absts/fetch_the_user_credential_for_config_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchUserCredential]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 12/01/2024
/// updatedAt: #

@LazySingleton(as: FetchTheUserCredentialForConfigAbst)
class FetchTheUserCredentialForConfigImpl
    implements FetchTheUserCredentialForConfigAbst {
  /// Note:  cette fonction permet d'obtenir le user credential

  @override
  Future<Map<String, dynamic>> fetchUserCredentialForConfig() async {
    return await SecureStorageRequest.fetchData(
      key: EnvPath.userCredentials,
    );
  }
}
