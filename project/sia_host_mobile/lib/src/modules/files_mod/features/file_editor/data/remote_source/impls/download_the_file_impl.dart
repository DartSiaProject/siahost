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
  Future<Map<String, dynamic>> downloadTheFile({
    required String serverAddress,
    // required String password,
    required String fileName,
    required String bucketName,
    required String key,
    required String iv,
  }) async {
    return await Object.downloadTheObject(
      // password: password,
      serverAddress: serverAddress,
      bucketName: bucketName,
      fileName: fileName,
      key: key,
      iv: iv,
    );
  }
}
