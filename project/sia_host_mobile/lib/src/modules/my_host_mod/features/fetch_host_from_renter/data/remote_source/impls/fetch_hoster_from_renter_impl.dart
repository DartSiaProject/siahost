import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/fetch_hoster_from_renter_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchTheHoster]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 12/01/2024
/// updatedAt: #

@LazySingleton(as: FetchHosterFromRenterAbst)
class FetchHosterFromRenterImpl implements FetchHosterFromRenterAbst {
  /// Note : cette fonctio permet de recupérer un hoster depuis le renter

  @override
  Future<Map<String, dynamic>> fetchTheHoster({
    required String serverAddress,
    // required String password,
    required String key,
    required String iv,
  }) async {
    return await Hoster.fetchSomeHost(
      // password: password,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
    // return Hoster.getHosts(
    //   serverAddress: serverAddress,
    //   key: key,
    //   iv: iv,
    // );
  }
}
