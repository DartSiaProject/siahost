import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/file_entity.dart';
import '../reposit_absts/fetch_all_buckets_and_files_reposit_abst.dart';

@lazySingleton
class FetchFilesFromBucketUsecase {
  final FetchAllBucketsAndFilesRepositAbst _fetchAllBucketsAndFilesRepositAbst;

  FetchFilesFromBucketUsecase({
    required FetchAllBucketsAndFilesRepositAbst
        fetchAllBucketsAndFilesRepositAbst,
  }) : _fetchAllBucketsAndFilesRepositAbst = fetchAllBucketsAndFilesRepositAbst;

  Future<Result<List<FileEntity>, String>> call({
    required String bucketName,
  }) async =>
      await _fetchAllBucketsAndFilesRepositAbst.fetchAllFilesFromBucket(
          bucketName: bucketName);
}
