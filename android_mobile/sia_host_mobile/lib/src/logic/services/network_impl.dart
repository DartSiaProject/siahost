import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/utils/extras/node/apis/host_api.dart'
    as hosts;
import 'package:sia_host_mobile/src/utils/messages/errors_message.dart';

import '../../utils/enums/errors_enum.dart';
import '../abstracts/network_abst.dart';
import '../models/host.dart';

/// Project: [Sia],
/// enterprise: [CotradeChain]
/// description:  Dans ce fichier, nous avons les fonctions suivantes [getAllHosts]
/// author: [James Brel]
/// createdAt: 18/07/2023
/// updatedAt:

class NetworkImpl implements NetworkAbst {
  //* Note : Cette fonction me permet d'obtenir tous les Hosts list venant du Net
  @override
  Future<Result<List<Host>, String>> getAllHosts() async {
    Result<List<Host>, String> _result = Result.error("");
    try {
      http.Response _responseHost = await http.post(
        Uri.parse(hosts.getHostApi),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: json.encode(
          {
            "network": "sia",
            "list": "active",
          },
        ),
      );
      switch (_responseHost.statusCode) {
        case 200:
          List<dynamic> _hostData = json.decode(_responseHost.body);
          List<Host> _hostList =
              _hostData.map((host) => Host.fromMap(host)).toList();
          _result = Result.success(_hostList);
          break;

        default:
          print(_responseHost.body);
      }
    } on SocketException {
      _result = Result.error(ErrorsMessage.networkError(Errors.connexionError));
    } catch (exception) {
      _result = Result.error(ErrorsMessage.networkError(Errors.errorUnknown));
    }
    return _result;
  }
}
