import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/upload_file_on_server_abst.dart';

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
  Future<Map<String, dynamic>> uploadTheFile({
    required String serverAddress,
    // required String password,
    required String bucketName,
    required String fileName,
    required File file,
    required String key,
    required String iv,
  }) async {
    return await Object.uploadAnObject(
      // password: password,
      bucketName: bucketName,
      fileName: fileName,
      file: file,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
