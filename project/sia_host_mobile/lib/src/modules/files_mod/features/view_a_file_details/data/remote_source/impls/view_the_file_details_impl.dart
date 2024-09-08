import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/view_the_file_details_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [viewTheDetailsFile]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 06/08/2024
/// updatedAt: 08/08/2024

@LazySingleton(as: ViewTheFileDetailsAbst)
class ViewTheFileDetailsImpl implements ViewTheFileDetailsAbst {
  /// Note : This function allow to visualize the File
  @override
  Future<Map<String, dynamic>> viewTheDetailsFile({
    required String serverAddress,
    // required String password,
    required String fileName,
    required String bucketName,
    required String key,
    required String iv,
  }) async {
    return await Object.getTheDetailsObject(
      // password: password,
      serverAddress: serverAddress,
      bucketName: bucketName,
      fileName: fileName,
      key: key,
      iv: iv,
    );
  }
}
