import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/download_file/domain/reposit_absts/user_download_the_file_reposit_abst.dart';

@lazySingleton
class UserDowloadAFileUsecase {
  final UserDownloadTheFileRepositAbst _userDownloadTheFileRepositAbst;

  UserDowloadAFileUsecase({
    required UserDownloadTheFileRepositAbst userDownloadTheFileRepositAbst,
  }) : _userDownloadTheFileRepositAbst = userDownloadTheFileRepositAbst;
}
