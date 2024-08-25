import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../../../../shared/services/http/apis/host_api.dart';
import '../../../../../../../shared/services/http/requests/http_get_request.dart';
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
  Future<Map<String, dynamic>> fetchTheAddressCountry({
    required String ipAddressConverted,
  }) async {
    return await HttpGetRequest.get<String>(
        api: getAddressCountryHostApi(hostIp: ipAddressConverted),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });
  }
}
