import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../domain/entities/card_of_host_entity.dart';
import '../../domain/reposit_absts/fetch_the_list_for_all_host_data_reposit_abst.dart';
import '../remote_source/absts/fetch_all_host_data_abst.dart';
import '../remote_source/models/card_of_host_model.dart';

@LazySingleton(as: FetchTheListForAllHostDataRepositAbst)
class FetchTheListForAllHostDataRepositImpl
    implements FetchTheListForAllHostDataRepositAbst {
  final FetchAllHostDataAbst _fetchAllHostDataAbst;

  var _allHostList = <CardOfHostEntity>[];
  var _hostSearched = <CardOfHostEntity>[];

  FetchTheListForAllHostDataRepositImpl({
    required FetchAllHostDataAbst fetchAllHostDataAbst,
  }) : _fetchAllHostDataAbst = fetchAllHostDataAbst;

  @override
  Future<Result<List<CardOfHostEntity>, String>> fetchAllTheHostsList() async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return await _fetchAllHostDataAbst.fetchAllHostData().then((_resultHost) {
        if (_resultHost["status"] &&
            (_resultHost["response"] as Response<String>).statusCode ==
                HttpStatus.ok) {
          _allHostList.clear();
          Map<String, dynamic> _hostDataGet =
              json.decode((_resultHost["response"] as Response<String>).data!);
          List<dynamic> _allHostData = _hostDataGet["hosts"];

          for (var _hostData in _allHostData) {
            var _dataMap = {
              "public_key": _hostData["public_key"],
              "finalScore": 8, //todo:  il faudra dynamisé ça
              "total_storage": _hostData["settings"]["total_storage"].toDouble()
            };
            var _cardHostInfoModel = CardOfHostModel.fromMap(_dataMap);

            var _cardOfEntityData = CardOfHostEntity(
              pubKey: _cardHostInfoModel.pubKey,
              finalScore: _cardHostInfoModel.finalScore,
              totalStorage: _cardHostInfoModel.totalStorage,
            );
            _allHostList.add(_cardOfEntityData);
          }

          return Result.success(_allHostList);
        } else if (_resultHost["status"] == false &&
                (_resultHost["error"] as DioException).type ==
                    DioExceptionType.connectionTimeout ||
            (_resultHost["error"] as DioException).type ==
                DioExceptionType.receiveTimeout) {
          _allHostList.clear();
          return const Result.error(Lang.timeErrorText);
        } else {
          _allHostList.clear();
          return const Result.error(Lang.internalServerErrorText);
        }
      });
    } else {
      _allHostList.clear();
      return const Result.error(Lang.noConnectionText);
    }
  }

  @override
  Future<Result<List<CardOfHostEntity>, String>> searchHostByPubKey({
    required String pubKey,
  }) async {
    _hostSearched.clear();
    _hostSearched = _allHostList
        .where((hostElement) => hostElement.pubKey == pubKey)
        .toList();

    if (_hostSearched.isNotEmpty) {
      return Result.success(_hostSearched);
    } else {
      return const Result.error(Lang.hostNotExistText);
    }
  }
}
