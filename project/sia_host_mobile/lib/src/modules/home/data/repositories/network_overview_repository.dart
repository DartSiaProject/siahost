import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/modules/home/data/models/models.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/security/data_decrypter.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';

@LazySingleton()
class NetworkOverviewRepository {
  NetworkOverviewRepository(this._storage);

  final StorageService _storage;

  /// Get all host and establish the statistic
  /// of the actual network
  ///
  Future<NetworkDataModel> getData() async {
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
        );

        // Return the network data overview
        return _calculateResult(dataList as List);
      } else {
        throw DartSiaException.handleError(result['error']);
      }
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }

  /// Make all operations
  /// to get the detailled overview of the network
  ///
  NetworkDataModel _calculateResult(List<dynamic> dataList) {
    final activeHosts = dataList
        .where(
          (h) => h['checks']['autopilot']['usability']['gouging'] == true,
        )
        .toList();

    // 1. Count hosts
    final hostCount = activeHosts.length;

    // 2. Total storage (TB)
    final totalStorage = activeHosts
        .map((h) => h['settings']['totalstorage'] as int)
        .fold(0, (a, b) => a + b);

    final totalTB = totalStorage / 1e12;

    // 3. Used storage (TB)
    final usedStorage = activeHosts
        .map(
          (h) =>
              (h['settings']['totalstorage'] as int) -
              (h['settings']['remainingstorage'] as int),
        )
        .fold(0, (a, b) => a + b);

    final usedTB = usedStorage / 1e12;

    // 4. Avg storage price (SC/TB/month)
    final prices = activeHosts
        .map(
          (h) =>
              BigInt.parse(
                h['settings']['storageprice'] as String,
              ).toDouble() /
              1e12,
        )
        .toList();

    final avgPrice = prices.isNotEmpty
        ? prices.reduce((a, b) => a + b) / prices.length
        : 0.0;

    return NetworkDataModel(
      totalCurrentHosts: hostCount,
      totalNetworkStorage: totalTB,
      totalUsedStorage: usedTB,
      pricePerTb: avgPrice,
      activeContractCount: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    );
  }
}
