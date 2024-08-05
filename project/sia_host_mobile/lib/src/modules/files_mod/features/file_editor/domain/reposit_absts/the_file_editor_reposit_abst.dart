import 'package:multiple_result/multiple_result.dart';

abstract class TheFileEditorRepositAbst {
  Future<Result<String, String>> deleteOneFile({
    required String fileNameWithExtension,
  });
}
