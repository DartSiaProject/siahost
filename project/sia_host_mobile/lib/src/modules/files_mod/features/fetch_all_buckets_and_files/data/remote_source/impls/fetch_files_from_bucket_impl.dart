import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/fetch_files_from_bucket_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchAllFilesOfBucket]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 22/07/2024
/// updatedAt: 27/08/2024
@LazySingleton(as: FetchFilesFromBucketAbst)
class FetchFilesFromBucketImpl implements FetchFilesFromBucketAbst {
  @override
  Future<Map<String, dynamic>> fetchAllFilesOfBucket({
    required String serverAddress,
    // required String password,
    required String bucketName,
    required String prefixPath,
    required String key,
    required String iv,
  }) async {
    return await Object.getListOfObjectLimited(
      // password: password,
      serverAddress: serverAddress,
      bucketName: bucketName,
      limit: double.maxFinite.toInt(),
      prefix: prefixPath,
      key: key,
      iv: iv,
    );
  }
}
