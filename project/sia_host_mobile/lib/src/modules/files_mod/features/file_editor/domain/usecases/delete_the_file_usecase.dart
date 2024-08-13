import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../reposit_absts/delete_the_file_reposit_abst.dart';

@lazySingleton
class DeleteTheFileUsecase {
  final DeleteTheFileRepositAbst _deleteTheFileRepositAbst;

  DeleteTheFileUsecase({
    required DeleteTheFileRepositAbst deleteTheFileRepositAbst,
  }) : _deleteTheFileRepositAbst = deleteTheFileRepositAbst;

  Future<Result<String, String>> call({
    required String fileName,
    required String bucketName,
  }) async =>
      await _deleteTheFileRepositAbst.deleteOneFile(
        fileName: fileName,
        bucketName: bucketName,
      );
}
