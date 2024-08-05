import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/delete_the_file_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [deleteTheFile]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 04/08/2024
/// updatedAt: #
@LazySingleton(as: DeleteTheFileAbst)
class DeleteTheFileImpl implements DeleteTheFileAbst {
  /// Note : This function allow to delete a file
  @override
  Future<Response> deleteTheFile({
    required String serverAddress,
    required String password,
    required String fileNameWithExtension,
  }) async {
    return await Object.deleteTheObject(
      password: password,
      serverAddress: serverAddress,
      fileNameWithExtension: fileNameWithExtension,
    );
  }
}
