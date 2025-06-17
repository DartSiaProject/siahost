import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/modules/current_host/data/models/models.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/security/data_decrypter.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';
import 'package:sia_host_mobile/src/shared/utils/enums.dart';

@LazySingleton()
class CurrentHostRepository {
  CurrentHostRepository(this._storage);
  final StorageService _storage;

  Future<CurrentHostInfoModel> getData() async {
    try {
      final userInfo = _storage.currentUserDecrypted!;

      // Get the host detail from renterd
      final result = await Hoster.fetchSomeHost(
        serverAddress: userInfo.serverAddress,
        key: userInfo.key,
        iv: userInfo.iv,
      );

      if (result['status'] == true && result.containsKey('response')) {
        final response =
            (result['response'] as Response<dynamic>).data as String;
        final data = json.decode(response) as Map<String, dynamic>;

        // decode the response
        final hostMapped = json.decode(
          DataDecrypter.decryptStringWithAES256CBC(
            chipherText: data['data'] as String,
            key: userInfo.key,
            iv: userInfo.iv,
          ),
        ) as Map<String, dynamic>;

        // Get block height from consensus
        final blockHeight = await _getBlockHeight();

        // Map the host data to CurrentHostInfoModel
        final hostInfo = CurrentHostInfoModel.fromJson(hostMapped);
        return hostInfo.copyWith(
          blockHeight: blockHeight,
        );
      } else {
        throw DartSiaException.handleError(result['error']);
      }
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }

  /// Get the block height from consensus
  ///
  Future<String> _getBlockHeight() async {
    try {
      final userInfo = _storage.currentUserDecrypted!;

      // Get the host detail from renterd
      final result = await Consensus.getState(
        serverAddress: userInfo.serverAddress,
        key: userInfo.key,
        iv: userInfo.iv,
      );

      if (result['status'] == true && result.containsKey('response')) {
        final response =
            (result['response'] as Response<dynamic>).data as String;
        final data = json.decode(response) as Map<String, dynamic>;

        // decode the response
        final consensusMapped = json.decode(
          DataDecrypter.decryptStringWithAES256CBC(
            chipherText: data['data'] as String,
            key: userInfo.key,
            iv: userInfo.iv,
          ),
        ) as Map<String, dynamic>;

        if (consensusMapped.containsKey('blockHeight')) {
          return consensusMapped['blockHeight'].toString();
        }

        throw const DartSiaException(
          'Consensus block height not found',
          error: ResponseStatus.unknown,
        );
      } else {
        throw DartSiaException.handleError(result['error']);
      }
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }
}
