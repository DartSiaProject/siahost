import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/file_entity.dart';
import '../reposit_absts/fetch_all_buckets_and_files_reposit_abst.dart';

@lazySingleton
class FetchFilesFromFolderUsecase {
  final FetchAllBucketsAndFilesRepositAbst _fetchAllBucketsAndFilesRepositAbst;

  FetchFilesFromFolderUsecase({
    required FetchAllBucketsAndFilesRepositAbst
        fetchAllBucketsAndFilesRepositAbst,
  }) : _fetchAllBucketsAndFilesRepositAbst = fetchAllBucketsAndFilesRepositAbst;

  Future<Result<List<FileEntity>, String>> call({
    required String bucketName,
    required String prefix,
  }) async =>
      await _fetchAllBucketsAndFilesRepositAbst.fetchAllFilesFromFolder(
        bucketName: bucketName,
        prefix: prefix,
      );
}
