import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/modules/notifications/data/models/notification_response_model.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/security/data_decrypter.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';

@LazySingleton()
class NotificationRepository {
  NotificationRepository(this._storage);

  final StorageService _storage;

  Future<NotificationResponseModel> findAll({
    int page = 0,
  }) async {
    const limit = 10;
    final offset = page * limit;

    try {
      final userInfo = _storage.currentUserDecrypted!;

      final result = await Notification.findAll(
        serverAddress: userInfo.serverAddress,
        key: userInfo.key,
        iv: userInfo.iv,
        offset: offset,
      );

      if (result['status'] == true && result.containsKey('response')) {
        final response =
            (result['response'] as Response<dynamic>).data as String;
        final resData = json.decode(response) as Map<String, dynamic>;

        // decode the data
        final data = json.decode(
          DataDecrypter.decryptStringWithAES256CBC(
            chipherText: resData['data'] as String,
            key: userInfo.key,
            iv: userInfo.iv,
          ),
        ) as Map<String, dynamic>;

        // Return the list of alerts
        return NotificationResponseModel.fromJson(data);
      } else {
        throw DartSiaException.handleError(result['error']);
      }
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }

  Future<void> dismissList({
    required List<String> ids,
  }) async {
    try {
      final userInfo = _storage.currentUserDecrypted!;

      final result = await Notification.dismissList(
        serverAddress: userInfo.serverAddress,
        key: userInfo.key,
        iv: userInfo.iv,
        ids: ids,
      );

      if (result['status'] == true && result.containsKey('response')) {
        return;
      } else {
        throw DartSiaException.handleError(result['error']);
      }
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }
}
