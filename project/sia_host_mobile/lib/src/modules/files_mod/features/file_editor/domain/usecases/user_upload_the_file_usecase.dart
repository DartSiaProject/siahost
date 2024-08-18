import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../reposit_absts/upload_a_file_reposit_abst.dart';

@lazySingleton
class UserUploadTheFileUsecase {
  final UploadAFileRepositAbst _uploadAFileRepositAbst;

  UserUploadTheFileUsecase({
    required UploadAFileRepositAbst uploadAFileRepositAbst,
  }) : _uploadAFileRepositAbst = uploadAFileRepositAbst;

  Future<Result<String, String>> call({
    required String bucketName,
  }) async =>
      await _uploadAFileRepositAbst.userUploadTheFileInBucket(
          bucketName: bucketName);
}
