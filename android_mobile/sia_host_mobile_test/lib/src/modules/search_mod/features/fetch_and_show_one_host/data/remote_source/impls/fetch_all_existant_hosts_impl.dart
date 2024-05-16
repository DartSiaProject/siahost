import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/shared/services/http/apis/host_api.dart'
    as host;
import 'package:sia_host_mobile/src/shared/services/http/requests/http_requests.dart';

import '../absts/fetch_all_existant_hosts_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchAllHosts]
/// author: [James Brel]
/// version: 1.0.0
/// createdAt: 12/01/2023
/// updatedAt: #

@LazySingleton(as: FetchAllExistantHostsAbst)
class FetchAllExistantHostsImpl implements FetchAllExistantHostsAbst {
  /// Note :  cette fonction permet de récupérer tous les host qui sont actif

  @override
  Future<Response> fetchAllHosts() async {
    return await HttpRequests.get(
      apiUri: host.getAllHostApi,
    );
  }
}
