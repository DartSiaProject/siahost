import 'package:injectable/injectable.dart';

import '../../../../../../../shared/constants/envs_const.dart';
import '../../../../../../../shared/services/cache/enums/shared_preference_enum.dart';
import '../../../../../../../shared/services/cache/requests/shared_preference_streaming_request.dart';
import '../absts/cache_the_user_credential_after_login_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [cacheUserCredentialAfterLogin]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 11/01/2024
/// updatedAt: #
@LazySingleton(as: CacheTheUserCredentialAfterLoginAbst)
class CacheTheUserCredentialsAfterLoginImpl
    implements CacheTheUserCredentialAfterLoginAbst {
  /// Note : Cette fonction permet de sauvegarder les identifiants de l'utilisateur
  @override
  Future<void> cacheUserCredentialAfterLogin({
    required String userPresence,
  }) async {
    return await SharedPreferenceStreamRequest.writeData(
      key: EnvPath.userPresence,
      data: {
        "value": userPresence,
      },
      preferences: Preferences.stringType,
    );
  }
}
