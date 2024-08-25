import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/delete_the_file_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [deleteTheFile]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 04/08/2024
/// updatedAt: 08/08/2024
@LazySingleton(as: DeleteTheFileAbst)
class DeleteTheFileImpl implements DeleteTheFileAbst {
  /// Note : This function allow to delete a file
  @override
  Future<Map<String, dynamic>> deleteTheFile({
    required String serverAddress,
    required String password,
    required String fileName,
    required String bucketName,
  }) async {
    return await Object.deleteTheObject(
        password: password,
        serverAddress: serverAddress,
        fileName: fileName,
        bucketName: bucketName);
  }
}
