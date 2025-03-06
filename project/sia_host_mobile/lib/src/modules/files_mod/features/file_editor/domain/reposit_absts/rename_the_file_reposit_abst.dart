import 'package:multiple_result/multiple_result.dart';

import '../entities/rename_file_info_entity.dart';

abstract class RenameTheFileRepositAbst {
  Future<Result<String, String>> renameTheFile({
    required RenameFileInfoEntity renameFileInfoEntity,
  });
}
