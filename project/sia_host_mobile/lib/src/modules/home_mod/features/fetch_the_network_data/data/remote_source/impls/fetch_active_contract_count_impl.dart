import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/shared/services/http/apis/contract_api.dart'
    as contract;
import 'package:sia_host_mobile/src/shared/services/http/requests/http_get_request.dart';

import '../absts/fetch_active_contract_count_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchAllActiveContractCount]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 11/01/2023
/// updatedAt: #

@LazySingleton(as: FetchActiveContractCountAbst)
class FetchActiveContractCountImpl implements FetchActiveContractCountAbst {
  /// Note: cette fonction permet de récupérer tous les contract active

  @override
  Future<Map<String, dynamic>> fetchAllActiveContractCount() async {
    return await HttpGetRequest.get<String>(
        api: contract.getActiveContractsApi,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });
  }
}
