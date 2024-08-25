import 'package:multiple_result/multiple_result.dart';

import '../entities/bucket_entity.dart';
import '../entities/file_entity.dart';

abstract class FetchAllBucketsAndFilesRepositAbst {
  Future<Result<List<BucketEntity>, String>> fetchAllBuckets();
  Future<Result<List<FileEntity>, String>> fetchAllFilesFromBucket({
    required String bucketName,
    required String prefix,
  });
  Future<Result<List<FileEntity>, String>> fetchAllFilesFromFolder({
    required String bucketName,
    required String prefix,
  });
}
