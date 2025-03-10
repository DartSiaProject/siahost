import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/modules/notifications/data/models/notification_response_model.dart';

import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/features/fetch_user_credentials/data/local_source/absts/fetch_the_user_credential_abst.dart';
import '../../../../shared/global/map_variable.dart' as global;
import '../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../shared/services/cryptography/requests/decrypt_request.dart';
import '../../../../shared/services/security/requests/encrypter_request.dart';

@LazySingleton()
class NotificationRepository {
  NotificationRepository({
    required FetchTheUserCredentialAbst fetchTheUserCredentialAbst,
  }) : _fetchTheUserCredentialAbst = fetchTheUserCredentialAbst;

  final FetchTheUserCredentialAbst _fetchTheUserCredentialAbst;

  Future<Result<NotificationResponseModel, String>> findAll({
    int page = 0,
  }) async {
    const limit = 10;
    final offset = page * limit;
    if ((await ConnectionRequest.checkConnectivity())) {
      if (global.userInfo.isEmpty) {
        final resCredentials =
            await _fetchTheUserCredentialAbst.fetchUserCredential();

        if (resCredentials['status'] == false) {
          return const Result.error(Lang.makeLoginDemandText);
        }

        global.userInfo = json.decode(resCredentials['data']);
      }

      final result = await Notification.findAll(
        serverAddress: EncrypterRequest.decrypt(
          dataEncrypted: global.userInfo["userServerAdress"],
        ),
        key: EncrypterRequest.decrypt(
          dataEncrypted: global.userInfo["userKey"],
        ),
        iv: EncrypterRequest.decrypt(dataEncrypted: global.userInfo["userIv"]),
        limit: limit,
        offset: offset,
      );

      if (result['status'] == true) {
        final response = result['response'] as Response<dynamic>;

        if (response.statusCode == HttpStatus.ok) {
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

          // Printing the list of alerts
          if (kDebugMode) print(dataList);

          // Returning the list of alerts
          return Result.success(
            NotificationResponseModel.fromJson(dataList),
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

  Future<dynamic> dismissList({
    required List<String> ids,
  }) async {}
}
