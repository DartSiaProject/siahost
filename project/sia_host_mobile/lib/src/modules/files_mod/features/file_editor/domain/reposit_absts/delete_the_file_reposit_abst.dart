import 'package:multiple_result/multiple_result.dart';

abstract class DeleteTheFileRepositAbst {
  Future<Result<String, String>> deleteOneFile({
    required String fileName,
    required String bucketName,
  });
}
