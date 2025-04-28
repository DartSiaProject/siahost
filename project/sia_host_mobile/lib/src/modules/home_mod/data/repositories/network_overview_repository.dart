import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/modules/home_mod/data/models/network_data.dart';
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart';
import 'package:sia_host_mobile/src/shared/features/fetch_user_credentials/data/local_source/absts/fetch_the_user_credential_abst.dart';
import 'package:sia_host_mobile/src/shared/global/map_variable.dart' as global;
import 'package:sia_host_mobile/src/shared/services/connection/requests/connection_request.dart';
import 'package:sia_host_mobile/src/shared/services/cryptography/requests/decrypt_request.dart';
import 'package:sia_host_mobile/src/shared/services/security/requests/encrypter_request.dart';

@LazySingleton()
class NetworkOverviewRepository {
  NetworkOverviewRepository({
    required FetchTheUserCredentialAbst fetchTheUserCredentialAbst,
  }) : _fetchTheUserCredentialAbst = fetchTheUserCredentialAbst;

  final FetchTheUserCredentialAbst _fetchTheUserCredentialAbst;

  Future<Result<NetworkDataModel, String>> getData() async {
    if ((await ConnectionRequest.checkConnectivity())) {
      // Check if user is logged in
      if (global.userInfo.isEmpty) {
        final resCredentials =
            await _fetchTheUserCredentialAbst.fetchUserCredential();

        if (resCredentials['status'] == false) {
          return const Result.error(Lang.makeLoginDemandText);
        }

        global.userInfo = json.decode(resCredentials['data']);
      }

      // Get the host list from renterd
      final result = await Hoster.getHosts(
        serverAddress: EncrypterRequest.decrypt(
          dataEncrypted: global.userInfo["userServerAdress"],
        ),
        key: EncrypterRequest.decrypt(
          dataEncrypted: global.userInfo["userKey"],
        ),
        iv: EncrypterRequest.decrypt(dataEncrypted: global.userInfo["userIv"]),
      );

      if (result['status'] == true) {
        final response = result['response'] as Response<dynamic>;

        if (response.statusCode == HttpStatus.ok) {
          // decode the network list
          dynamic dataList = json.decode(
            DecryptRequest.decryptStringWithAES256CBC(
              chipherText: json.decode(response.data!)["data"],
              key: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userKey"],
              ),
              iv: EncrypterRequest.decrypt(
                dataEncrypted: global.userInfo["userIv"],
              ),
            ),
          );

          // Returning the network data overview
          final data = _calculateResult(dataList);
          return Result.success(
            data,
          );
        } else {
          // Printing the error which actually occured
          print('An error has occured');
          if (kDebugMode) print(response.data);
          return const Result.error(Lang.internalServerErrorText);
        }
      } else {
        final error = result['error'] as DioException;

        if (error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.connectionTimeout) {
          return const Result.error(Lang.timeErrorText);
        }

        return const Result.error(Lang.internalServerErrorText);
      }
    } else {
      return const Result.error(Lang.noConnectionText);
    }
  }

  /// Make all operations
  /// to get the detailled overview of network
  NetworkDataModel _calculateResult(List dataList) {
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
        .map((h) =>
            BigInt.parse(
              h['settings']['storageprice'],
            ).toDouble() /
            1e12)
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

/// dart compute function
///
@pragma('')
void tester() {}
