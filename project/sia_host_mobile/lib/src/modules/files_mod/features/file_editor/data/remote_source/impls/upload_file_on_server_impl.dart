import 'dart:io';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/data/remote_source/absts/upload_file_on_server_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [uploadTheFile]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 09/08/2024
/// updatedAt: #

@LazySingleton(as: UploadFileOnServerAbst)
class UploadFileOnServerImpl implements UploadFileOnServerAbst {
  /// Note : This function allow to upload the file to server

  @override
  Future<Response> uploadTheFile({
    required String serverAddress,
    required String password,
    required String bucketName,
    required String fileName,
    required File file,
  }) async {
    return await Object.uploadAnObject(
        password: password,
        bucketName: bucketName,
        fileName: fileName,
        file: file,
        serverAddress: serverAddress);
  }
}
