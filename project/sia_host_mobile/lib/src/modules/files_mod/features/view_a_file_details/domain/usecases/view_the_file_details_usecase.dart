import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/file_details_entity.dart';
import '../reposit_absts/user_view_the_file_details_reposit_abst.dart';

@lazySingleton
class ViewTheFileDetailsUsecase {
  final UserViewTheFileDetailsRepositAbst _userViewTheFileDetailsRepositAbst;

  ViewTheFileDetailsUsecase({
    required UserViewTheFileDetailsRepositAbst
        userViewTheFileDetailsRepositAbst,
  }) : _userViewTheFileDetailsRepositAbst = userViewTheFileDetailsRepositAbst;

  Future<Result<FileDetailsEntity, String>> call({
    required String fileName,
    required String bucketName,
  }) async =>
      await _userViewTheFileDetailsRepositAbst.userViewTheFileDetails(
        fileName: fileName,
        bucketName: bucketName,
      );
}
