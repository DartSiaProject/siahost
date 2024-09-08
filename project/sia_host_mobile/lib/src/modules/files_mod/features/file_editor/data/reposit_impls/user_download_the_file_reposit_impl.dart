import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/constants/string_const.dart';
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/cryptography/requests/decrypt_request.dart';
import '../../../../../../shared/services/permissions/requests/permission_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../domain/reposit_absts/user_download_the_file_reposit_abst.dart';
import '../local_source/absts/save_the_file_downloaded_abst.dart';
import '../remote_source/absts/download_the_file_abst.dart';

@LazySingleton(as: UserDownloadTheFileRepositAbst)
class UserDownloadTheFileRepositImpl implements UserDownloadTheFileRepositAbst {
  final DownloadTheFileAbst _downloadTheFileAbst;
  final SaveTheFileDownloadedAbst _saveTheFileDownloadedAbst;

  UserDownloadTheFileRepositImpl({
    required DownloadTheFileAbst downloadTheFileAbst,
    required SaveTheFileDownloadedAbst saveTheFileDownloadedAbst,
  })  : _downloadTheFileAbst = downloadTheFileAbst,
        _saveTheFileDownloadedAbst = saveTheFileDownloadedAbst;

  @override
  Future<Result<Map<String, dynamic>, String>> userDownloadTheFile({
    required String fileName,
    required String bucketName,
  }) async {
    if ((await PermissionRequest.requestPermissionAndResult(
        permissionType: Permission.storage))) {
      if (await File("$storageDownload/$fileName").exists()) {
        return Result.success({
          "data": fileName,
          "message": Lang.fileAlreadyDownloadText,
        });
      } else {
        if ((await ConnectionRequest.checkConnectivity())) {
          return await _downloadTheFileAbst
              .downloadTheFile(
                  serverAddress: EncrypterRequest.decrypt(
                      dataEncrypted: global.userInfo["userServerAdress"]),
                  // password: EncrypterRequest.decrypt(
                  //     dataEncrypted: userInfo["userPassWord"]),
                  key: EncrypterRequest.decrypt(
                      dataEncrypted: global.userInfo["userKey"]),
                  iv: EncrypterRequest.decrypt(
                      dataEncrypted: global.userInfo["userIv"]),
                  fileName: fileName,
                  bucketName: bucketName)
              .then((_response) {
            if (_response["status"] &&
                (_response["response"] as Response<String>).statusCode ==
                    HttpStatus.ok) {
              return _saveTheFileDownloadedAbst
                  .saveTheFileDownload(
                fileNameWithExtension: fileName,
                fileBytes: DecryptRequest.decryptBytesWithAES256CBC(
                  chipherText: json.decode(
                      (_response["response"] as Response<String>)
                          .data!)["data"],
                  key: EncrypterRequest.decrypt(
                      dataEncrypted: global.userInfo["userKey"]),
                  iv: EncrypterRequest.decrypt(
                      dataEncrypted: global.userInfo["userIv"]),
                ),
              )
                  .then((_responseSave) {
                if (_responseSave["status"]) {
                  return Result.success({
                    "data": fileName,
                    "message": Lang.fileDownloadSuccessText,
                  });
                } else {
                  return const Result.error(Lang.fileDownloadFailedText);
                }
              });
            } else if (_response["status"] == false &&
                    (_response["error"] as DioException).type ==
                        DioExceptionType.connectionTimeout ||
                (_response["error"] as DioException).type ==
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
    } else {
      return const Result.error(Lang.permisionErrorText);
    }
  }
}
