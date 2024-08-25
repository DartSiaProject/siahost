import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/rename_the_file_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [renameTheFile]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 05/08/2024
/// updatedAt: #
@LazySingleton(as: RenameTheFileAbst)
class RenameTheFileImpl implements RenameTheFileAbst {
  /// Note :  This function allow to rename a file
  @override
  Future<Map<String, dynamic>> renameTheFile({
    required String serverAddress,
    required String password,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
  }) async {
    return await Object.renameSingleObject(
      password: password,
      serverAddress: serverAddress,
      bucketName: bucketName,
      oldFileName: oldFileName,
      newFileName: newFileName,
    );
  }
}
