import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sia_host_mobile/src/shared/constants/string_const.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/global/map_variable.dart';
import '../../../../../../shared/services/connection/requests/connection_request.dart';
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
                      dataEncrypted: userInfo["userServerAdress"]),
                  password: EncrypterRequest.decrypt(
                      dataEncrypted: userInfo["userPassWord"]),
                  fileName: fileName,
                  bucketName: bucketName)
              .then((_response) {
            if (_response.statusCode == HttpStatus.ok) {
              return _saveTheFileDownloadedAbst
                  .saveTheFileDownload(
                fileNameWithExtension: fileName,
                fileBytes: _response.bodyBytes,
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
