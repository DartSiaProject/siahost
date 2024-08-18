import 'package:multiple_result/multiple_result.dart';

import '../entities/file_details_entity.dart';

abstract class UserViewTheFileDetailsRepositAbst {
  Future<Result<FileDetailsEntity, String>> userViewTheFileDetails({
    required String fileName,
    required String bucketName,
  });
}
