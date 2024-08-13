import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/constants/string_const.dart';
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../domain/entities/rename_file_info_entity.dart';
import '../../domain/reposit_absts/rename_the_file_reposit_abst.dart';
import '../remote_source/absts/rename_the_file_abst.dart';

@LazySingleton(as: RenameTheFileRepositAbst)
class RenameTheFileRepositImpl implements RenameTheFileRepositAbst {
  final RenameTheFileAbst _renameTheFileAbst;

  RenameTheFileRepositImpl({
    required RenameTheFileAbst renameTheFileAbst,
  }) : _renameTheFileAbst = renameTheFileAbst;

  @override
  Future<Result<String, String>> renameTheFile({
    required RenameFileInfoEntity renameFileInfoEntity,
  }) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return await _renameTheFileAbst
          .renameTheFile(
        serverAddress: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userServerAdress"]),
        password: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userPassWord"]),
        bucketName: renameFileInfoEntity.bucketName,
        oldFileName: renameFileInfoEntity.oldFileName,
        newFileName: renameFileInfoEntity.newFileName,
      )
          .then((_response) {
        if (_response.statusCode == HttpStatus.ok) {
          return const Result.success(Lang.fileRenamedText);
        } else if (_response.body.contains(errorRenameObject)) {
          return const Result.error(Lang.notRenameFolderText);
        } else {
          return const Result.error(Lang.internalServerErrorText);
        }
      });
    } else {
      return const Result.error(Lang.noConnectionText);
    }
  }
}
