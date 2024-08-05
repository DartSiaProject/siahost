import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../reposit_absts/the_file_editor_reposit_abst.dart';

@lazySingleton
class DeleteTheFileUsecase {
  final TheFileEditorRepositAbst _theFileEditorRepositAbst;

  DeleteTheFileUsecase({
    required TheFileEditorRepositAbst theFileEditorRepositAbst,
  }) : _theFileEditorRepositAbst = theFileEditorRepositAbst;

  Future<Result<String, String>> call({
    required String fileNameWithExtension,
  }) async =>
      await _theFileEditorRepositAbst.deleteOneFile(
        fileNameWithExtension: fileNameWithExtension,
      );
}
