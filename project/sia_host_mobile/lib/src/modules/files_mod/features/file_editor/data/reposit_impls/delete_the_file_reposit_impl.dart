import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../domain/reposit_absts/delete_the_file_reposit_abst.dart';
import '../remote_source/absts/delete_the_file_abst.dart';

@LazySingleton(as: DeleteTheFileRepositAbst)
class DeleteTheFileRepositImpl implements DeleteTheFileRepositAbst {
  final DeleteTheFileAbst _deleteTheFileAbst;

  DeleteTheFileRepositImpl({
    required DeleteTheFileAbst deleteTheFileAbst,
  }) : _deleteTheFileAbst = deleteTheFileAbst;

  @override
  Future<Result<String, String>> deleteOneFile({
    required String fileName,
    required String bucketName,
  }) async {
    if ((await ConnectionRequest.checkConnectivity())) {
      return await _deleteTheFileAbst
          .deleteTheFile(
        serverAddress: EncrypterRequest.decrypt(
            dataEncrypted: global.userInfo["userServerAdress"]),
        // password: EncrypterRequest.decrypt(
        //     dataEncrypted: global.userInfo["userPassWord"]),
        key:
            EncrypterRequest.decrypt(dataEncrypted: global.userInfo["userKey"]),
        iv: EncrypterRequest.decrypt(dataEncrypted: global.userInfo["userIv"]),
        fileName: fileName,
        bucketName: bucketName,
      )
          .then((_response) {
        if (_response["status"] &&
            (_response["response"] as Response<String>).statusCode ==
                HttpStatus.ok) {
          return const Result.success(Lang.fileDeletedSuccessText);
        } else if (_response["status"] == false &&
                (_response["error"] as DioException).type ==
                    DioExceptionType.connectionTimeout ||
            (_response["error"] as DioException).type ==
                DioExceptionType.receiveTimeout) {
          return const Result.error(Lang.timeErrorText);
        } else {
          return const Result.success(Lang.internalServerErrorText);
        }
      });
    } else {
      return const Result.error(Lang.noConnectionText);
    }
  }
}
