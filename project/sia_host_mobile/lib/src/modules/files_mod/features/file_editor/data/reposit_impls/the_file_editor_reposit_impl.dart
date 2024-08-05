import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../domain/reposit_absts/the_file_editor_reposit_abst.dart';
import '../remote_source/absts/delete_the_file_abst.dart';

@LazySingleton(as: TheFileEditorRepositAbst)
class TheFileEditorRepositImpl implements TheFileEditorRepositAbst {
  final DeleteTheFileAbst _deleteTheFileAbst;

  TheFileEditorRepositImpl({
    required DeleteTheFileAbst deleteTheFileAbst,
  }) : _deleteTheFileAbst = deleteTheFileAbst;

  @override
  Future<Result<String, String>> deleteOneFile({
    required String fileNameWithExtension,
  }) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return await _deleteTheFileAbst
          .deleteTheFile(
        serverAddress: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userServerAdress"]),
        password: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userPassWord"]),
        fileNameWithExtension: fileNameWithExtension,
      )
          .then((_response) {
        if (_response.statusCode == HttpStatus.ok) {
          return const Result.success(Lang.fileDeletedSuccessText);
        } else {
          return const Result.success(Lang.internalServerErrorText);
        }
      });
    } else {
      return const Result.error(Lang.noConnectionText);
    }
  }
}
