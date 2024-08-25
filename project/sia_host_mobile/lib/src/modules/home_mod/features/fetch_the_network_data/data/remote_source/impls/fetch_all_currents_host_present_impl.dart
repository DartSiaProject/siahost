import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/shared/services/http/apis/host_api.dart'
    as host;
import 'package:sia_host_mobile/src/shared/services/http/requests/http_get_request.dart';

import '../absts/fetch_all_currents_host_present_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchAllHostCurrents]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 11/01/2023
/// updatedAt: #

@LazySingleton(as: FetchAllCurrentsHostPresentAbst)
class FetchAllCurrentsHostPresentImpl
    implements FetchAllCurrentsHostPresentAbst {
  /// Note :  cette fonction permet de récupérer tous les host qui sont actif

  @override
  Future<Map<String, dynamic>> fetchAllHostCurrents() async {
    return await HttpGetRequest.get<String>(
      api: host.getAllHostApi,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }
}
