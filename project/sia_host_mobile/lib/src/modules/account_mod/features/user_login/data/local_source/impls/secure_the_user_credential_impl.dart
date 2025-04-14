import 'package:injectable/injectable.dart';

import '../../../../../../../shared/constants/envs_const.dart';
import '../../../../../../../shared/services/cache/requests/secure_storage_request.dart';
import '../absts/secure_the_user_credential_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [secureUserCredentials]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 12/01/2024
/// updatedAt: #

@LazySingleton(as: SecureTheUserCredentialAbst)
class SecureTheUserCredentialImpl implements SecureTheUserCredentialAbst {
  /// Note :  cette fonction permet de sécuriser les users crédentials

  @override
  Future<void> secureUserCredentials({
    required String userCredentialsJsoned,
  }) async {
    await SecureStorageRequest.writeData(
        key: EnvPath.userCredentials, data: userCredentialsJsoned);
  }
}
