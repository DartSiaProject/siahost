import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/data/local_source/absts/save_the_file_downloaded_abst.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/data/remote_source/absts/download_the_file_abst.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/domain/reposit_absts/user_download_the_file_reposit_abst.dart';
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart';
import 'package:sia_host_mobile/src/shared/global/map_variable.dart';
import 'package:sia_host_mobile/src/shared/services/connection/requests/connection_request.dart';
import 'package:sia_host_mobile/src/shared/services/permissions/requests/permission_request.dart';
import 'package:sia_host_mobile/src/shared/services/security/requests/encrypter_request.dart';

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
  Future<Result<String, String>> userDownloadTheFile({
    required String fileName,
    required String bucketName,
  }) async {
    if ((await PermissionRequest.requestPermissionAndResult(
        permissionType: Permission.storage))) {
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
                return const Result.success(Lang.fileDownloadSuccessText);
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
    } else {
      return const Result.error("");
    }
  }
}
