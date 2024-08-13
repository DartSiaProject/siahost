import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/view_a_file_details/domain/entities/file_details_entity.dart';

abstract class UserViewTheFileDetailsRepositAbst {
  Future<Result<FileDetailsEntity, String>> userViewTheFileDetails({
    required String fileName,
    required String bucketName,
  });
}
