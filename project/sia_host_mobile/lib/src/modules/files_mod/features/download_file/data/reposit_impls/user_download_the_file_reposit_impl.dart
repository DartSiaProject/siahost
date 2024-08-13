import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/download_file/data/remote_source/absts/download_the_file_abst.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/download_file/domain/reposit_absts/user_download_the_file_reposit_abst.dart';

@LazySingleton(as: UserDownloadTheFileRepositAbst)
class UserDownloadTheFileRepositImpl implements UserDownloadTheFileRepositAbst {
  final DownloadTheFileAbst _downloadTheFileAbst;

  UserDownloadTheFileRepositImpl({
    required DownloadTheFileAbst downloadTheFileAbst,
  }) : _downloadTheFileAbst = downloadTheFileAbst;
}
