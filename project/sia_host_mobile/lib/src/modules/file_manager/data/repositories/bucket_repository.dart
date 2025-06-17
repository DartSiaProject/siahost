import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart' as renterd;
import 'package:sia_host_mobile/src/modules/file_manager/data/models/models.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/security/data_decrypter.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';

@LazySingleton()
class BucketRepository {
  BucketRepository(this._storage);
  final StorageService _storage;

  /// Find all buckets
  ///
  Future<List<BucketModel>> findAll() async {
    final userInfo = _storage.currentUserDecrypted!;

    final result = await renterd.Object.getListOfBucket(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
    );

    if (result['status'] == true && result.containsKey('response')) {
      final response = (result['response'] as Response<dynamic>).data as String;
      final data = json.decode(response) as Map<String, dynamic>;

      // decode the network list
      final dataList = json.decode(
        DataDecrypter.decryptStringWithAES256CBC(
          chipherText: data['data'] as String,
          key: userInfo.key,
          iv: userInfo.iv,
        ),
      ) as List;

      // Map the data to BucketModel
      return dataList.map((e) {
        final bucket = BucketModel.fromJson(e as Map<String, dynamic>);
        return bucket;
      }).toList();
    } else {
      throw DartSiaException.handleError(result['error']);
    }
  }

  /// Create a new bucket
  ///
  Future<BucketModel> createBucket(
    String bucketName,
  ) async {
    final userInfo = _storage.currentUserDecrypted!;

    final result = await renterd.Object.createBucket(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
      bucketName: bucketName,
    );

    if (result['status'] == true && result.containsKey('response')) {
      return BucketModel(name: bucketName);
    } else {
      throw DartSiaException.handleError(result['error']);
    }
  }

  /// Find all objects in a bucket
  ///
  Future<List<BucketObjectModel>> findAllObjects(
    String bucketName, {
    required int limit,
    String? prefix,
    String delimiter = '/',
    String? marker,
    String? sortBy,
    String? sortDir,
    String? substring,
  }) async {
    final userInfo = _storage.currentUserDecrypted!;

    final result = await renterd.Object.getObjectList(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
      bucketName: bucketName,
      prefix: prefix,
      delimiter: delimiter,
      limit: limit,
      marker: marker,
      sortBy: sortBy,
      sortDir: sortDir,
      substring: substring,
    );

    if (result['status'] == true && result.containsKey('response')) {
      final response = (result['response'] as Response<dynamic>).data as String;
      final data = json.decode(response) as Map<String, dynamic>;

      // decode the network list
      final dataMapped = json.decode(
        DataDecrypter.decryptStringWithAES256CBC(
          chipherText: data['data'] as String,
          key: userInfo.key,
          iv: userInfo.iv,
        ),
      ) as Map<String, dynamic>;

      final dataList = dataMapped['objects'] as List? ?? [];

      // Map the data to BucketObjectModel
      return dataList.map((e) {
        final object = BucketObjectModel.fromJson(
          (e as Map<String, dynamic>)
            ..addAll({
              'bucket': bucketName,
            }),
        );
        return object;
      }).toList();
    } else {
      throw DartSiaException.handleError(result['error']);
    }
  }
}
