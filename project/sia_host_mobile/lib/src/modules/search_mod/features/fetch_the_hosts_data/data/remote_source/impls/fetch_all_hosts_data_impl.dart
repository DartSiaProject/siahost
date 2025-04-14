import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/shared/services/http/apis/host_api.dart'
    as host;
import 'package:sia_host_mobile/src/shared/services/http/requests/http_get_request.dart';

import '../absts/fetch_all_host_data_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchAllHostData]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 11/01/2023
/// updatedAt: #

@LazySingleton(as: FetchAllHostDataAbst)
class FetchAllHostDataImpl implements FetchAllHostDataAbst {
  /// Note :  cette fonction permet de récupérer tous les host qui sont actif

  @override
  Future<Map<String, dynamic>> fetchAllHostData() async {
    return await HttpGetRequest.get<String>(
      api: host.getAllHostApi,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }
}
