import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/data/local_source/absts/pick_the_file_from_phone_abst.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/data/remote_source/absts/upload_file_on_server_abst.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/domain/reposit_absts/upload_a_file_reposit_abst.dart';
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart';
import 'package:sia_host_mobile/src/shared/extensions/file_ext.dart';
import 'package:sia_host_mobile/src/shared/global/map_variable.dart';
import 'package:sia_host_mobile/src/shared/services/connection/requests/connection_request.dart';
import 'package:sia_host_mobile/src/shared/services/security/requests/encrypter_request.dart';

@LazySingleton(as: UploadAFileRepositAbst)
class UploadAFileRepositImpl implements UploadAFileRepositAbst {
  final UploadFileOnServerAbst _uploadFileOnServerAbst;
  final PickTheFileFromPhoneAbst _pickTheFileFromPhoneAbst;

  UploadAFileRepositImpl({
    required UploadFileOnServerAbst uploadFileOnServerAbst,
    required PickTheFileFromPhoneAbst pickTheFileFromPhoneAbst,
  })  : _uploadFileOnServerAbst = uploadFileOnServerAbst,
        _pickTheFileFromPhoneAbst = pickTheFileFromPhoneAbst;

  @override
  Future<Result<String, String>> userUploadTheFileInBucket({
    required String bucketName,
  }) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return await _pickTheFileFromPhoneAbst
          .pickTheFile()
          .then((_dataPicked) async {
        if (_dataPicked["status"]) {
          File _filePicked = File(_dataPicked["data"] as String);

          return await _uploadFileOnServerAbst
              .uploadTheFile(
            serverAddress: EncrypterRequest.decrypt(
                dataEncrypted: userInfo["userServerAdress"]),
            password: EncrypterRequest.decrypt(
                dataEncrypted: userInfo["userPassWord"]),
            bucketName: bucketName,
            fileName: _filePicked.name,
            file: _filePicked,
          )
              .then((_response) {
            if (_response.statusCode == HttpStatus.ok) {
              return const Result.success(Lang.fileUploadedText);
            } else {
              print(_response.body);
              return const Result.error(Lang.internalServerErrorText);
            }
          });
        } else {
          return const Result.error(Lang.noFilePickedText);
        }
      });
    } else {
      return const Result.error(Lang.noConnectionText);
    }
  }
}
