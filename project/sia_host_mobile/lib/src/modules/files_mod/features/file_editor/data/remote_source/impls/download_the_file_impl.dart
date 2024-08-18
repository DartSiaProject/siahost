import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/download_the_file_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [downloadTheFile]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 13/08/2024
/// updatedAt: #
@LazySingleton(as: DownloadTheFileAbst)
class DownloadTheFileImpl implements DownloadTheFileAbst {
  /// Note : This function allow to download the file from server

  @override
  Future<Response> downloadTheFile({
    required String serverAddress,
    required String password,
    required String fileName,
    required String bucketName,
  }) async {
    return await Object.downloadTheObject(
      password: password,
      serverAddress: serverAddress,
      bucketName: bucketName,
      fileName: fileName,
    );
  }
}
