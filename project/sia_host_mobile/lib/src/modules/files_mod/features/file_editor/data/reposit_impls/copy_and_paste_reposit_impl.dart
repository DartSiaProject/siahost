import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/constants/string_const.dart';
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../domain/entities/copy_file_info_entity.dart';
import '../../domain/reposit_absts/copy_and_paste_reposit_abst.dart';
import '../remote_source/absts/copy_the_file_abst.dart';

@LazySingleton(as: CopyAndPasteRepositAbst)
class CopyAndPasteRepositImpl implements CopyAndPasteRepositAbst {
  final CopyTheFileAbst _copyTheFileAbst;

  CopyAndPasteRepositImpl({
    required CopyTheFileAbst copyTheFileAbst,
  }) : _copyTheFileAbst = copyTheFileAbst;

  @override
  Future<Result<String, String>> copyAndPasteFile(
      {required CopyFileInfoEntity copyFileInfoEntity}) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return await _copyTheFileAbst
          .copyAndPasteTheFile(
        serverAddress: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userServerAdress"]),
        password: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userPassWord"]),
        sourceBucketName: copyFileInfoEntity.sourceBucketName,
        sourcefileName: copyFileInfoEntity.sourcefileName,
        destBucketName: copyFileInfoEntity.destBucketName,
        destfileName: copyFileInfoEntity.destfileName,
      )
          .then((_response) {
        if (_response["status"] &&
            (_response["response"] as Response<String>).statusCode ==
                HttpStatus.ok) {
          return const Result.success(Lang.copyIsDoneText);
        } else if (_response["status"] &&
            (_response["response"] as Response<String>)
                .data!
                .contains(errorDstBucket)) {
          return const Result.error(Lang.theBucketDestinationNotExistText);
        } else if (_response["status"] &&
            (_response["response"] as Response<String>)
                .data!
                .contains(errorSrcObject)) {
          return const Result.error(Lang.theSrcObjectNotExistText);
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
}
