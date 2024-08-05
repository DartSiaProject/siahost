import 'package:http/http.dart';

abstract class FetchFilesFromBucketAbst {
  Future<Response> fetchAllFilesOfBucket({
    required String serverAddress,
    required String password,
    required String bucketName,
  });
}
