import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/copy_the_file_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [copyTheFile]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 04/08/2024
/// updatedAt: #
@LazySingleton(as: CopyTheFileAbst)
class CopyTheFileImpl implements CopyTheFileAbst {
  /// Note :  This function allow to copy and paste a file
  @override
  Future<Map<String, dynamic>> copyAndPasteTheFile({
    required String serverAddress,
    required String password,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
  }) async {
    return await Object.copyTheObject(
      password: password,
      serverAddress: serverAddress,
      sourceBucketName: sourceBucketName,
      sourcefileName: sourcefileName,
      destBucketName: destBucketName,
      destfileName: destfileName,
    );
  }
}
