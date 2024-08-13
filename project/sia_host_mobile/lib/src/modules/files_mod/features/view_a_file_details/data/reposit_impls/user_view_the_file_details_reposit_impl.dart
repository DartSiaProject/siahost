import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/view_a_file_details/data/remote_source/absts/view_the_file_details_abst.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/view_a_file_details/data/remote_source/models/file_details_model.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/view_a_file_details/domain/entities/file_details_entity.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/view_a_file_details/domain/reposit_absts/user_view_the_file_details_reposit_abst.dart';
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart';
import 'package:sia_host_mobile/src/shared/global/map_variable.dart' as global;
import 'package:sia_host_mobile/src/shared/services/connection/requests/connection_request.dart';
import 'package:sia_host_mobile/src/shared/services/security/requests/encrypter_request.dart';

@LazySingleton(as: UserViewTheFileDetailsRepositAbst)
class UserViewTheFileDetailsRepositImpl
    implements UserViewTheFileDetailsRepositAbst {
  final ViewTheFileDetailsAbst _viewTheFileDetailsAbst;

  UserViewTheFileDetailsRepositImpl(
      {required ViewTheFileDetailsAbst viewTheFileDetailsAbst})
      : _viewTheFileDetailsAbst = viewTheFileDetailsAbst;

  @override
  Future<Result<FileDetailsEntity, String>> userViewTheFileDetails({
    required String fileName,
    required String bucketName,
  }) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      print(fileName);
      return await _viewTheFileDetailsAbst
          .viewTheDetailsFile(
        serverAddress: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userServerAdress"]),
        password: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userPassWord"]),
        fileName: fileName,
        bucketName: bucketName,
      )
          .then((_response) {
        if (_response.statusCode == HttpStatus.ok) {
          Map<String, dynamic> _data = json.decode(_response.body)["object"];

          FileDetailsModel _fileData = FileDetailsModel.fromMap(_data);
          return Result.success(
            FileDetailsEntity(
              fileName: _fileData.fileName,
              fileSize: _fileData.fileSize,
              modTime: _fileData.modTime,
            ),
          );
        } else {
          return const Result.error(Lang.internalServerErrorText);
        }
      });
    } else {
      return const Result.error(Lang.noConnectionText);
    }
  }
}
