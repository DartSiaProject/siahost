import 'package:multiple_result/multiple_result.dart';

import '../entities/copy_file_info_entity.dart';

abstract class CopyAndPasteRepositAbst {
  Future<Result<String, String>> copyAndPasteFile(
      {required CopyFileInfoEntity copyFileInfoEntity});
}
