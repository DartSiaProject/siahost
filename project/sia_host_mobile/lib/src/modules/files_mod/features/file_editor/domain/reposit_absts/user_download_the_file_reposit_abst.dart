import 'package:multiple_result/multiple_result.dart';

abstract class UserDownloadTheFileRepositAbst {
  Future<Result<Map<String, dynamic>, String>> userDownloadTheFile({
    required String fileName,
    required String bucketName,
  });
}
