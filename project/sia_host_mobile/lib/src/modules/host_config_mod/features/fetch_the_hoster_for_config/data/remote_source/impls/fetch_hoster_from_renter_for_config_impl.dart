import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/fetch_hoster_from_renter_for_config_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchTheHosterForConfiguration]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 12/01/2024
/// updatedAt: #

@LazySingleton(as: FetchHosterFromRenterForConfigAbst)
class FetchHosterFromRenterForConfigImpl
    implements FetchHosterFromRenterForConfigAbst {
  /// Note : cette fonctio permet de recupérer un hoster depuis le renter

  @override
  Future<Map<String, dynamic>> fetchTheHosterForConfiguration({
    required String serverAddress,
    required String password,
  }) async {
    return await Hoster.fetchSomeHost(
        password: password, serverAddress: serverAddress);
  }
}
