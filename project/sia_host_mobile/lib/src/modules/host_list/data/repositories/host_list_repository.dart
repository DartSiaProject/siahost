import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/modules/host_list/data/models/models.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/helpers/host_helper.dart';
import 'package:sia_host_mobile/src/shared/security/data_decrypter.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';

@LazySingleton()
class HostListRepository {
  HostListRepository(this._storage);

  final StorageService _storage;

  Future<List<HostInfoModel>> getHostList() async {
    final userInfo = _storage.currentUserDecrypted!;

    try {
      // Get the host list from renterd
      final result = await Hoster.getHosts(
        serverAddress: userInfo.serverAddress,
        key: userInfo.key,
        iv: userInfo.iv,
      );

      if (result['status'] == true && result.containsKey('response')) {
        final response =
            (result['response'] as Response<dynamic>).data as String;
        final data = json.decode(response) as Map<String, dynamic>;

        // decode the network list
        final dataList = json.decode(
          DataDecrypter.decryptStringWithAES256CBC(
            chipherText: data['data'] as String,
            key: userInfo.key,
            iv: userInfo.iv,
          ),
        ) as List;

        // Filter the hosts that are gouging
        // and map them to HostInfoModel
        final hosts = dataList
            .where(
          (h) => h['checks']['autopilot']['usability']['gouging'] == true,
        )
            .map((e) {
          final map = e as Map<String, dynamic>;
          final settings = map['settings'] as Map<String, dynamic>;

          return HostInfoModel(
            publicKey: map['publicKey'] as String,
            finalScore: HostHelper.getFinalScore(map),
            netAddress: map['netAddress'] as String,
            addressLocation: '',
            uploadPrice: HostHelper.convertPricing(
              settings['uploadbandwidthprice'] as String,
            ),
            downloadPrice: HostHelper.convertPricing(
              settings['downloadbandwidthprice'] as String,
            ),
            storagePrice: HostHelper.convertPricing(
              settings['storageprice'] as String,
            ),
            acceptingContracts: settings['acceptingcontracts'] as bool,
            totalStorage: HostHelper.convertStorage(
              settings['totalstorage'] as num,
            ),
            remainingStorage: HostHelper.convertStorage(
              settings['remainingstorage'] as num,
            ),
            usedStorage: HostHelper.calculateUsedStorage(
              settings['totalstorage'] as num,
              settings['remainingstorage'] as num,
            ),
          );
        }).toList();

        return hosts;
      } else {
        throw DartSiaException.handleError(result['error']);
      }
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }
}
