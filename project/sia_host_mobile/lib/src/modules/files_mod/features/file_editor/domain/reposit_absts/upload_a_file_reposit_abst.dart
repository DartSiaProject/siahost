import 'package:multiple_result/multiple_result.dart';

abstract class UploadAFileRepositAbst {
  Future<Result<String, String>> userUploadTheFileInBucket({
    required String bucketName,
  });
}
