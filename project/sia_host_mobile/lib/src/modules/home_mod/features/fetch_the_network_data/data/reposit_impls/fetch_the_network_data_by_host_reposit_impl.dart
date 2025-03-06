import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../domain/entities/network_data_entity.dart';
import '../../domain/reposit_absts/fetch_the_network_data_by_host_reposit_abst.dart';
import '../remote_source/absts/fetch_active_contract_count_abst.dart';
import '../remote_source/absts/fetch_all_currents_host_present_abst.dart';
import '../remote_source/models/network_data_model.dart';

@LazySingleton(as: FetchTheNetworkDataByHostRepositAbst)
class FetchTheNetworkDataByHostRepositImpl
    implements FetchTheNetworkDataByHostRepositAbst {
  final FetchActiveContractCountAbst _fetchActiveContractCountAbst;
  final FetchAllCurrentsHostPresentAbst _fetchAllCurrentsHostPresentAbst;

  var _allCurrentHost = <dynamic>[];
  var _activeContractCountList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  FetchTheNetworkDataByHostRepositImpl({
    required FetchActiveContractCountAbst fetchActiveContractCountAbst,
    required FetchAllCurrentsHostPresentAbst fetchAllCurrentsHostPresentAbst,
  })  : _fetchActiveContractCountAbst = fetchActiveContractCountAbst,
        _fetchAllCurrentsHostPresentAbst = fetchAllCurrentsHostPresentAbst;

  @override
  Future<Result<NetworkDataEntity, String>> fetchAllHostCurrents() async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return await _fetchAllCurrentsHostPresentAbst
          .fetchAllHostCurrents()
          .then((_resultHost) async {
        if (_resultHost["status"] &&
            (_resultHost["response"] as Response<String>).statusCode ==
                HttpStatus.ok) {
          _allCurrentHost.clear();
          Map<String, dynamic> _hostData =
              json.decode((_resultHost["response"] as Response<String>).data!);
          _allCurrentHost = _hostData["hosts"];

          //? (1)-- total hosts currents --
          var _totalCurrentHosts = _allCurrentHost.length;

          //? (2)-- total network storage --
          var _totalNetworkStorage = 0;
          for (var _hostElement in _allCurrentHost) {
            int _totalStorage = _hostElement["settings"]["total_storage"];
            _totalNetworkStorage += _totalStorage;
          }
          //? (3)-- total used storage --
          var _totalRemainingStorage = 0;
          for (var _hostElement in _allCurrentHost) {
            int _remainingStorage =
                _hostElement["settings"]["remaining_storage"];
            _totalRemainingStorage += _remainingStorage;
          }
          var _totalUsedStorage = _totalNetworkStorage - _totalRemainingStorage;

          //? (4)-- price per tb --
          var _totalStoragePrice = BigInt.from(0);
          for (var _hostElement in _allCurrentHost) {
            String _storagePrice = _hostElement["settings"]["storage_price"];
            _totalStoragePrice += BigInt.parse(_storagePrice);
          }
          var _pricePerTp =
              _totalStoragePrice / BigInt.from(_totalNetworkStorage);

          //? (5)-- active contract count List --
          // await _fetchActiveContractCountAbst
          //     .fetchAllActiveContractCount()
          //     .then((_resultContract) {
          //   if (_resultContract.statusCode == HttpStatus.ok) {

          //     _activeContractCountList.clear();
          //     List<dynamic> _contractData = json.decode(_resultContract.body);

          //     _activeContractCountList = _contractData
          //         .map((contract) => int.parse(contract['activecontractcount']))
          //         .toList();
          //   } else {
          //     _activeContractCountList.clear();
          //   }
          // });

          // print({
          //   "totalCurrentHosts": _totalCurrentHosts.toDouble(),
          //   "totalNetworkStorage": _totalNetworkStorage
          //       .toDouble()
          //       .toStringAsPrecision(5)
          //       .substring(0, 4),
          //   "totalUsedStorage": _totalUsedStorage
          //       .toDouble()
          //       .toStringAsPrecision(5)
          //       .substring(0, 4),
          //   "pricePerTb": _pricePerTp.toStringAsPrecision(5).substring(0, 4),
          //   "activeContractCount": _activeContractCountList,
          // });

          var _networkDataModel = NetworkDataModel.fromMap({
            "totalCurrentHosts": _totalCurrentHosts.toDouble(),
            "totalNetworkStorage": _totalNetworkStorage.toDouble(),
            "totalUsedStorage": _totalUsedStorage.toDouble(),
            "pricePerTb": _pricePerTp,
            "activeContractCount": _activeContractCountList,
          });
          var _networkDataEntity = NetworkDataEntity(
            totalCurrentHosts: _networkDataModel.totalCurrentHosts,
            totalNetworkStorage: _networkDataModel.totalNetworkStorage,
            totalUsedStorage: _networkDataModel.totalUsedStorage,
            pricePerTb: _networkDataModel.pricePerTb,
            activeContractCount: _networkDataModel.activeContractCount,
          );

          return Result.success(_networkDataEntity);
        } else if (_resultHost["status"] == false &&
                (_resultHost["error"] as DioException).type ==
                    DioExceptionType.connectionTimeout ||
            (_resultHost["error"] as DioException).type ==
                DioExceptionType.receiveTimeout) {
          _allCurrentHost.clear();
          return const Result.error(Lang.timeErrorText);
        } else {
          _allCurrentHost.clear();
          return const Result.error(Lang.internalServerErrorText);
        }
      });
    } else {
      _allCurrentHost.clear();
      return const Result.error(Lang.noConnectionText);
    }
  }
}
