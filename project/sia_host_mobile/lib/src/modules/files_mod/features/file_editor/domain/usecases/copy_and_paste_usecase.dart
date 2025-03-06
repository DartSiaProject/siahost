import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/copy_file_info_entity.dart';
import '../reposit_absts/copy_and_paste_reposit_abst.dart';

@lazySingleton
class CopyAndPasteUsecase {
  final CopyAndPasteRepositAbst _copyAndPasteRepositAbst;

  CopyAndPasteUsecase({
    required CopyAndPasteRepositAbst copyAndPasteRepositAbst,
  }) : _copyAndPasteRepositAbst = copyAndPasteRepositAbst;

  Future<Result<String, String>> call({
    required CopyFileInfoEntity copyFileInfoEntity,
  }) async =>
      await _copyAndPasteRepositAbst.copyAndPasteFile(
          copyFileInfoEntity: copyFileInfoEntity);
}
