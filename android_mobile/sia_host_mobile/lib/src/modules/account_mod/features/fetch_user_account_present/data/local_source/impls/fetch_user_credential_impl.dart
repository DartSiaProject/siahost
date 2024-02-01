import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../shared/services/cache/enums/shared_preference_enum.dart';
import '../../../../../../../shared/services/cache/requests/shared_preference_streaming_request.dart';
import '../absts/fech_user_credential_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchUserCredential]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 11/01/2024
/// updatedAt: #

@LazySingleton(as: FetchUserCredentialAbst)
class FetchUserCredentialImpl implements FetchUserCredentialAbst {
  ///Note : cette fonction me permettra de rechercher les user credential qui ont été inséré localement

  @override
  Stream<Map<String, dynamic>> fetchUserCredential() {
    return SharedPreferenceStreamRequest.fetchData(
      key: "${dotenv.env["USER_PRESENCE"]}",
      preferences: Preferences.stringType,
      data: {
        "defaultValue": "",
      },
    );
  }
}
