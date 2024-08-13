import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/domain/reposit_absts/user_download_the_file_reposit_abst.dart';

@lazySingleton
class UserDowloadAFileUsecase {
  final UserDownloadTheFileRepositAbst _userDownloadTheFileRepositAbst;

  UserDowloadAFileUsecase({
    required UserDownloadTheFileRepositAbst userDownloadTheFileRepositAbst,
  }) : _userDownloadTheFileRepositAbst = userDownloadTheFileRepositAbst;

  Future<Result<String, String>> call({
    required String fileName,
    required String bucketName,
  }) async =>
      await _userDownloadTheFileRepositAbst.userDownloadTheFile(
        fileName: fileName,
        bucketName: bucketName,
      );
}