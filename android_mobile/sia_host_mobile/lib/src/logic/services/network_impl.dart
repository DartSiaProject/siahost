import 'dart:convert';
import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/logic/models/network.dart';
import 'package:sia_host_mobile/src/utils/enums/http_request_enum.dart';
import 'package:sia_host_mobile/src/utils/extras/node/apis/host_api.dart'
    as hosts;
import 'package:sia_host_mobile/src/utils/extras/node/apis/network_api.dart'
    as network;
import 'package:sia_host_mobile/src/utils/helpers/request_helpers/request_helper.dart';
import 'package:sia_host_mobile/src/utils/messages/errors_message.dart';

import '../../utils/enums/errors_enum.dart';
import '../abstracts/network_abst.dart';
import '../models/host.dart';

/// Project: [SiaHostsMobile],
/// enterprise: [CotradeChain]
/// description:  Dans ce fichier, nous avons les fonctions suivantes [getNetworkData]
/// author: [James Brel]
/// createdAt: 18/07/2023
/// updatedAt: 19/07/2023

class NetworkImpl implements NetworkAbst {
  //* Note : Cette fonction me permet d'obtenir tous les Hosts list venant du Net
  @override
  Future<Result<Map<String, dynamic>, String>> getNetworkData() async {
    Result<Map<String, dynamic>, String> _result = Result.error("");
    try {
      var _responseHost = await RequestHelper.httpMethod(
        requestType: HttpRequestType.post,
        contentBody: {
          "network": "sia",
          "list": "active",
        },
        apiUri: hosts.getHostApi,
      );

      var _responseNetwork = await RequestHelper.httpMethod(
        requestType: HttpRequestType.get,
        apiUri: network.getNetworkApi,
      );

      if (_responseHost.statusCode == 200 &&
          _responseNetwork.statusCode == 200) {
        List<dynamic> _hostData = json.decode(_responseHost.body);
        List<Host> _hostModelList =
            _hostData.map((host) => Host.fromMap(host)).toList();

        Network networkModel =
            Network.fromMap(json.decode(_responseNetwork.body));

        Map<String, dynamic> _networkData = {
          "hostModelList": _hostModelList,
          "networkModel": networkModel,
        };
        _result = Result.success(_networkData);
      }
    } on SocketException {
      _result = Result.error(ErrorsMessage.networkError(Errors.connexionError));
    } on Exception catch (_) {
      _result = Result.error(ErrorsMessage.networkError(Errors.errorUnknown));
    }
    return _result;
  }
}
