import 'dart:convert';
import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/utils/extras/node/apis/host_api.dart'
    as hosts;
import 'package:sia_host_mobile/src/utils/helpers/host_helpers/host_helper.dart';
import 'package:sia_host_mobile/src/utils/helpers/request_helpers/request_helper.dart';
import 'package:sia_host_mobile/src/utils/messages/errors_message.dart';

import '../../utils/enums/errors_enum.dart';
import '../abstracts/host_abst.dart';
import '../models/host.dart';

/// Project: [SiaHostsMobile],
/// enterprise: [CotradeChain]
/// description:  Dans ce fichier, nous avons les fonctions suivantes [getHostListData]
/// author: [James Brel]
/// createdAt: 25/07/2023
/// updatedAt: 31/07/2023
class HostImpl implements HostAbst {
  var _hostModelList = <Host>[];

  //* Note : Cette fonction me permet d'obtenir tous les Hosts data list venant du Net
  @override
  Future<Result<List<Host>, String>> getHostDataList() async {
    Result<List<Host>, String> _result = Result.error("");
    try {
      var _responseHost = await RequestHelper.post(
        contentBody: {
          "network": "sia",
          "list": "active",
        },
        apiUri: hosts.getAllHostApi,
      );
      if (_responseHost.statusCode == 200) {
        List<dynamic> _hostData = json.decode(_responseHost.body);
        _hostModelList = _hostData.map((host) => Host.fromMap(host)).toList();
        _result = Result.success(_hostModelList);
      }
    } on SocketException {
      _result = Result.error(ErrorsMessage.networkError(Errors.connexionError));
    } on Exception catch (_) {
      _result = Result.error(ErrorsMessage.networkError(Errors.errorUnknown));
    }
    return _result;
  }

  //* Note : Cette fonction me permet d'obtenir un ou une list de host par le biais de la clé publique , à travers la liste qui sera pré-remplie
  @override
  Future<Result<List<Host>, String>> getHostByPubKey({
    required String pubKey,
  }) async {
    Result<List<Host>, String> _result = Result.error("");
    var _hostSearched = _hostModelList
        .where((hostElement) => hostElement.pubkey == pubKey)
        .toList();

    if (_hostSearched.isNotEmpty) {
      _result = Result.success(_hostSearched);
    } else {
      _result = Result.error(ErrorsMessage.hostError(Errors.listError));
    }
    return _result;
  }

  //* Note : Cette fonction me permet d'obtenir un ou une list de host par le biais de la clé publique , à travers la liste qui sera pré-remplie

  @override
  Future<Host> getOneHostByPubKey({
    required String pubKey,
  }) async {
    Host _oneHost = _hostModelList
        .singleWhere((hostElement) => hostElement.pubkey == pubKey);
    var _countryAddress =
        await HostHelper.getHostAddressCountry(dns: _oneHost.currentIp);
    Host _newHostModel = _oneHost.copyWith(addressLocationIp: _countryAddress);

    return _newHostModel;
  }
}
