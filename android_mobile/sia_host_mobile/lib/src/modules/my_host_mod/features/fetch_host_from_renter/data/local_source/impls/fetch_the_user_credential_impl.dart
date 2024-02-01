import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../shared/services/cache/requests/secure_storage_request.dart';
import '../absts/fetch_the_user_credential_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchUserCredential]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 12/01/2024
/// updatedAt: #

@LazySingleton(as: FetchTheUserCredentialAbst)
class FetchTheUserCredentialImpl implements FetchTheUserCredentialAbst {
  /// Note:  cette fonction permet d'obtenir le user credential

  @override
  Future<Map<String, dynamic>> fetchUserCredential() async {
    return await SecureStorageRequest.fetchData(
        key: "${dotenv.env["USER_CREDENTIALS"]}");
  }
}
