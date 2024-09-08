import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/helpers/host_helper.dart';
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../domain/entities/host_info_entity.dart';
import '../../domain/reposit_absts/fetch_one_host_data_reposit_abst.dart';
import '../remote_source/absts/fetch_all_existant_hosts_abst.dart';
import '../remote_source/absts/fetch_the_host_address_country_abst.dart';
import '../remote_source/models/host_info_model.dart';

@LazySingleton(as: FetchOneHostDataRepositAbst)
class FetchOneHostDataRepositImpl implements FetchOneHostDataRepositAbst {
  final FetchAllExistantHostsAbst _fetchAllExistantHostsAbst;
  final FetchTheHostAddressCountryAbst _fetchTheHostAddressCountryAbst;

  FetchOneHostDataRepositImpl({
    required FetchAllExistantHostsAbst fetchAllExistantHostsAbst,
    required FetchTheHostAddressCountryAbst fetchTheHostAddressCountryAbst,
  })  : _fetchAllExistantHostsAbst = fetchAllExistantHostsAbst,
        _fetchTheHostAddressCountryAbst = fetchTheHostAddressCountryAbst;

  @override
  Future<Result<HostInfoEntity, String>> fetchOneHost({
    required String pubKey,
  }) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return _fetchAllExistantHostsAbst
          .fetchAllHosts()
          .then((_resultHost) async {
        if (_resultHost["status"] &&
            (_resultHost["response"] as Response<String>).statusCode ==
                HttpStatus.ok) {
          Map<String, dynamic> _hostDataGet =
              json.decode((_resultHost["response"] as Response<String>).data!);
          List<dynamic> _allHostData = _hostDataGet["hosts"];

          Map<String, dynamic> _hostData = _allHostData.singleWhere(
              (hostElement) => hostElement["public_key"] == pubKey);

          var _ipAddressConverted = await HostHelper.convertDnsToIp(
              dnsAddress: _hostData["net_address"]);

          var _townAndCountry = "";
          await _fetchTheHostAddressCountryAbst
              .fetchTheAddressCountry(ipAddressConverted: _ipAddressConverted)
              .then((_resultCountry) {
            if (_resultCountry["status"] &&
                (_resultCountry["response"] as Response<String>).statusCode ==
                    HttpStatus.ok) {
              Map<String, dynamic> _countryData = json.decode(
                  (_resultCountry["response"] as Response<String>).data!);
              _townAndCountry =
                  "${_countryData["city"]}, ${_countryData["country"]}";
            } else {
              print("aaa");
            }
          });

          var _data = <String, dynamic>{
            "pubkey": _hostData["public_key"],
            "finalScore": 8,
            "currentIp": _ipAddressConverted,
            "addressLocationIp": _townAndCountry,
            "uploadPrice": int.parse(_hostData["settings"]["upload_price"]),
            "downloadPrice": int.parse(_hostData["settings"]["download_price"]),
            "storagePrice": int.parse(_hostData["settings"]["storage_price"]),
            "online": _hostData["online"],
            "acceptingContracts": _hostData["settings"]["accepting_contracts"],
            "contractPrice":
                double.parse(_hostData["settings"]["contract_price"]),
            "totalStorage": _hostData["settings"]["total_storage"].toDouble(),
            "usedStorage": (_hostData["settings"]["total_storage"] -
                    _hostData["settings"]["remaining_storage"])
                .toDouble(),
            "remainingStorage":
                _hostData["settings"]["remaining_storage"].toDouble(),
          };

          var _hostInfoModel = HostInfoModel.fromMap(_data);
          var _hostInfoEntity = HostInfoEntity(
            pubKey: _hostInfoModel.pubKey,
            finalScore: _hostInfoModel.finalScore,
            currentIp: _hostInfoModel.currentIp,
            addressLocationIp: _hostInfoModel.addressLocationIp,
            uploadPrice: _hostInfoModel.uploadPrice,
            downloadPrice: _hostInfoModel.downloadPrice,
            storagePrice: _hostInfoModel.storagePrice,
            online: _hostInfoModel.online,
            acceptingContracts: _hostInfoModel.acceptingContracts,
            contractPrice: _hostInfoModel.contractPrice,
            totalStorage: _hostInfoModel.totalStorage,
            usedStorage: _hostInfoModel.usedStorage,
            remainingStorage: _hostInfoModel.remainingStorage,
          );

          return Result.success(_hostInfoEntity);
        } else if (_resultHost["status"] == false &&
                (_resultHost["error"] as DioException).type ==
                    DioExceptionType.connectionTimeout ||
            (_resultHost["error"] as DioException).type ==
                DioExceptionType.receiveTimeout) {
          return const Result.error(Lang.timeErrorText);
        } else {
          return const Result.error(Lang.internalServerErrorText);
        }
      });
    } else {
      return const Result.error(Lang.noConnectionText);
    }
  }
}
