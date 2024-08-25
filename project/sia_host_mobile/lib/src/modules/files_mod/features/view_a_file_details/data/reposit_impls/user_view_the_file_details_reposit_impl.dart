import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../../../../../shared/global/map_variable.dart' as global;
import '../../../../../../shared/services/connection/requests/connection_request.dart';
import '../../../../../../shared/services/security/requests/encrypter_request.dart';
import '../../domain/entities/file_details_entity.dart';
import '../../domain/reposit_absts/user_view_the_file_details_reposit_abst.dart';
import '../remote_source/absts/view_the_file_details_abst.dart';
import '../remote_source/models/file_details_model.dart';

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
        if (_response["status"] &&
            (_response["response"] as Response<String>).statusCode ==
                HttpStatus.ok) {
          Map<String, dynamic> _data = json.decode(
              (_response["response"] as Response<String>).data!)["object"];

          FileDetailsModel _fileData = FileDetailsModel.fromMap(_data);
          return Result.success(
            FileDetailsEntity(
              fileName: _fileData.fileName,
              fileSize: _fileData.fileSize,
              modTime: _fileData.modTime,
            ),
          );
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
