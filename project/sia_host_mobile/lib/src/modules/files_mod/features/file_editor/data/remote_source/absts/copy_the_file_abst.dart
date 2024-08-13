import 'package:http/http.dart';

abstract class CopyTheFileAbst {
  Future<Response> copyAndPasteTheFile({
    required String serverAddress,
    required String password,
    required String sourceBucketName,
    required String sourcefileName,
    required String destBucketName,
    required String destfileName,
  });
}
