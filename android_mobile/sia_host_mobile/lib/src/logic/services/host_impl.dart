import 'dart:convert';
import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/logic/models/host_setting.dart';
import 'package:sia_host_mobile/src/utils/enums/success_enum.dart';
import 'package:sia_host_mobile/src/utils/extras/node/apis/host_api.dart'
    as hosts;
import 'package:sia_host_mobile/src/utils/helpers/host_helpers/host_helper.dart';
import 'package:sia_host_mobile/src/utils/helpers/request_helpers/request_helper.dart';
import 'package:sia_host_mobile/src/utils/messages/errors_message.dart';
import 'package:sia_host_mobile/src/utils/messages/success_message.dart';

import '../../utils/enums/errors_enum.dart';
import '../abstracts/host_abst.dart';
import '../models/host.dart';

/// Project: [SiaHostsMobile],
/// enterprise: [CotradeChain]
/// description:  Dans ce fichier, nous avons les fonctions suivantes [getHostListData]
/// author: [James Brel]
/// createdAt: 25/07/2023
/// updatedAt: 09/08/2023
class HostImpl implements HostAbst {
  var _hostModelList = <Host>[];

  /// Note : Cette fonction me permet d'obtenir tous les Hosts data list venant du Net
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
      _result = Result.error(ErrorsMessage.error(Errors.connexionError));
    } on Exception catch (_) {
      _result = Result.error(ErrorsMessage.error(Errors.errorUnknown));
    }
    return _result;
  }

  /// Note : Cette fonction me permet d'obtenir un ou une list de host par le biais de la clé publique , à travers la liste qui sera pré-remplie
  @override
  Future<Result<List<Host>, String>> getHostByPubKey({
    required String pubKey,
  }) async {
    Result<List<Host>, String> _result = const Result.error("");
    var _hostSearched = _hostModelList
        .where((hostElement) => hostElement.pubkey == pubKey)
        .toList();

    if (_hostSearched.isNotEmpty) {
      _result = Result.success(_hostSearched);
    } else {
      _result = Result.error(ErrorsMessage.error(Errors.listError));
    }
    return _result;
  }

  /// Note : Cette fonction me permet d'obtenir un ou une list de host par le biais de la clé publique , à travers la liste qui sera pré-remplie
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

  /// Note : Cette fonction me permet d'obtenir un host par le biais du package renterd
  @override
  Future<Result<HostSetting, String>> getSomeHostFromRenterd() async {
    Result<HostSetting, String> _result = const Result.error("");
    try {
      var _responseHoster = await Hoster.fetchSomeHost(password: "renterd");
      if (_responseHoster.statusCode == 200) {
        var _responseBody = json.decode(_responseHoster.body);

        if (_responseBody == null) {
          _result = Result.error(ErrorsMessage.error(Errors.myHostError));
        } else {
          HostSetting _hostSetting = HostSetting.fromMap(_responseBody);
          _result = Result.success(_hostSetting);
        }

        HostSetting _hostSetting = HostSetting.fromMap(_responseBody);
        _result = Result.success(_hostSetting);
      }
    } on SocketException {
      _result = Result.error(ErrorsMessage.error(Errors.connexionError));
    } on Exception catch (_) {
      _result = Result.error(ErrorsMessage.error(Errors.errorUnknown));
    }
    return _result;
  }

  /// Note : Cette fonction me permet de mettre a jour mon host
  @override
  Future<Result<String, String>> updateSomeHostFromRenterd({
    required HostSetting hostSetting,
  }) async {
    Result<String, String> _result = const Result.error("");
    try {
      var _hostSettingMap = hostSetting.toMap();
      var _responseHoster = await Hoster.updateSomeHost(
          password: "renterd", hostConfig: _hostSettingMap);
      if (_responseHoster.statusCode == 200) {
        _result =
            Result.success(SuccessMessage.success(SuccessType.configSuccess));
      }
    } on SocketException {
      _result = Result.error(ErrorsMessage.error(Errors.connexionError));
    } on Exception catch (_) {
      _result = Result.error(ErrorsMessage.error(Errors.errorUnknown));
    }
    return _result;
  }
}
