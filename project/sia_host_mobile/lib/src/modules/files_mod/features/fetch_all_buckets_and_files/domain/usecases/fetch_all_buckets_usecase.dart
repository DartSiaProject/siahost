import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/bucket_entity.dart';
import '../reposit_absts/fetch_all_buckets_and_files_reposit_abst.dart';

@lazySingleton
class FetchAllBucketsUsecase {
  final FetchAllBucketsAndFilesRepositAbst _fetchAllBucketsAndFilesRepositAbst;

  FetchAllBucketsUsecase({
    required FetchAllBucketsAndFilesRepositAbst
        fetchAllBucketsAndFilesRepositAbst,
  }) : _fetchAllBucketsAndFilesRepositAbst = fetchAllBucketsAndFilesRepositAbst;

  Future<Result<List<BucketEntity>, String>> call() async =>
      await _fetchAllBucketsAndFilesRepositAbst.fetchAllBuckets();
}
