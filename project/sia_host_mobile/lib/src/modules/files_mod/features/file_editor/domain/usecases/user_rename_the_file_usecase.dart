import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/rename_file_info_entity.dart';
import '../reposit_absts/rename_the_file_reposit_abst.dart';

@lazySingleton
class UserRenameTheFileUsecase {
  final RenameTheFileRepositAbst _renameTheFileRepositAbst;

  UserRenameTheFileUsecase({
    required RenameTheFileRepositAbst renameTheFileRepositAbst,
  }) : _renameTheFileRepositAbst = renameTheFileRepositAbst;

  Future<Result<String, String>> call({
    required RenameFileInfoEntity renameFileInfoEntity,
  }) async =>
      await _renameTheFileRepositAbst.renameTheFile(
          renameFileInfoEntity: renameFileInfoEntity);
}
