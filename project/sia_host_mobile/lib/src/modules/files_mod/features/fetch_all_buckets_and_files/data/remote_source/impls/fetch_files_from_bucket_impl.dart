import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/fetch_files_from_bucket_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchAllFilesOfBucket]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 22/07/2024
/// updatedAt: #
@LazySingleton(as: FetchFilesFromBucketAbst)
class FetchFilesFromBucketImpl implements FetchFilesFromBucketAbst {
  @override
  Future<Response> fetchAllFilesOfBucket({
    required String serverAddress,
    required String password,
    required String bucketName,
  }) async {
    return await Object.getListOfObjectLimited(
        password: password,
        serverAddress: serverAddress,
        bucketName: bucketName,
        limit: double.maxFinite.toInt(),
        prefix: "");
  }
}
