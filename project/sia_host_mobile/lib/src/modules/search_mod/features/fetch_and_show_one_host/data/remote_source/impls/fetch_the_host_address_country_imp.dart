import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../shared/services/http/apis/host_api.dart';
import '../../../../../../../shared/services/http/requests/http_requests.dart';
import '../absts/fetch_the_host_address_country_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchTheAddressCountry]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 12/01/2023
/// updatedAt: #

@LazySingleton(as: FetchTheHostAddressCountryAbst)
class FetchTheHostAddressCountryImpl implements FetchTheHostAddressCountryAbst {
  // Note: cette fonction permet de récupérer le pays d'une adress

  @override
  Future<Response> fetchTheAddressCountry({
    required String ipAddressConverted,
  }) async {
    return await HttpRequests.get(
        apiUri: getAddressCountryHostApi(hostIp: ipAddressConverted));
  }
}
