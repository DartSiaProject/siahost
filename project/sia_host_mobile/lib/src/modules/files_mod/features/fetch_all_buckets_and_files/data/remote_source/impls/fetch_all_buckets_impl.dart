import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';

import '../absts/fetch_all_buckets_abst.dart';

/// Project: [SiaHostsMobile],
/// description:  Dans ce fichier, nous avons les fonctions suivantes [fetchListOfBucket]
/// author: [James Brel]
/// version: 1.1.0
/// createdAt: 02/08/2024
/// updatedAt: 27/08/2024
@LazySingleton(as: FetchAllBucketsAbst)
class FetchAllBucketsImpl implements FetchAllBucketsAbst {
  @override
  Future<Map<String, dynamic>> fetchListOfBucket({
    required String serverAddress,
    // required String password,
    required String key,
    required String iv,
  }) async {
    return await Object.getListOfBucket(
      // password: password,
      serverAddress: serverAddress,
      key: key,
      iv: iv,
    );
  }
}
