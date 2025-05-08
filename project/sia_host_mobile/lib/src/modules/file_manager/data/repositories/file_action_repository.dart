import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:renterd/renterd.dart' as renterd;
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/security/data_decrypter.dart';
import 'package:sia_host_mobile/src/shared/services/file_storage_service.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';
import 'package:sia_host_mobile/src/shared/utils/enums.dart';

@LazySingleton()
class FileActionRepository {
  FileActionRepository(this._storage, this._fileStorageService);
  final StorageService _storage;
  final FileStorageService _fileStorageService;

  /// Copy File
  ///
  Future<void> copyFile({
    required BucketObjectModel sourcefile,
    required String destfileName,
    String? destBucketName,
  }) async {
    destBucketName ??= sourcefile.bucket;

    final userInfo = _storage.currentUserDecrypted!;

    final sourceFileName = sourcefile.key;

    final result = await renterd.Object.copyTheObject(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
      sourceBucketName: sourcefile.bucket,
      sourcefileName: sourceFileName,
      destBucketName: destBucketName,
      destfileName: destfileName,
    );

    if (result['status'] == true && result.containsKey('response')) {
      return;
    } else {
      throw DartSiaException.handleError(result['error']);
    }
  }

  /// Rename File
  ///
  Future<void> renameFile({
    required BucketObjectModel file,
    required String newFileName,
  }) async {
    final userInfo = _storage.currentUserDecrypted!;

    final result = await renterd.Object.renameSingleObject(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
      bucketName: file.bucket,
      oldFileName: file.key,
      newFileName: newFileName,
    );

    if (result['status'] == true && result.containsKey('response')) {
      // rename it in the local storage if it exists
      try {
        await _fileStorageService.renameFile(
          fileType: file.type,
          oldPath: file.name,
          newName: newFileName,
        );
      } catch (e) {
        Logger().e('Error renaming file in local storage: $e');
      }
      return;
    } else {
      throw DartSiaException.handleError(result['error']);
    }
  }

  /// Delete File
  ///
  Future<void> deleteFile({
    required BucketObjectModel file,
  }) async {
    final userInfo = _storage.currentUserDecrypted!;

    final result = await renterd.Object.deleteTheObject(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
      bucketName: file.bucket,
      fileName: file.key,
    );

    if (result['status'] == true && result.containsKey('response')) {
      return;
    } else {
      throw DartSiaException.handleError(result['error']);
    }
  }

  /// Upload a file to a bucket
  ///
  Future<void> uploadFile({
    required String bucketName,
    required String fileName,
    required File file,
    void Function(int sent, int total)? onSendProgress,
  }) async {
    final userInfo = _storage.currentUserDecrypted!;

    await renterd.Object.uploadFile(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
      bucketName: bucketName,
      fileName: fileName,
      file: file,
      onSendProgress: onSendProgress,
    );

    return;
  }

  /// Download a file from a bucket
  ///
  Future<bool> downloadFile({
    required BucketObjectModel fileObject,
    void Function(int received, int total)? onReceiveProgress,
  }) async {
    // 1. Request permission
    if (!await _fileStorageService.requestStoragePermission()) {
      throw const DartSiaException(
        'Please accept storage permission first.',
        error: ResponseStatus.noStoragePermission,
      );
    }

    // 2. Check storage space
    if (!await _fileStorageService.hasEnoughSpace(fileObject.size)) {
      throw const DartSiaException(
        'Not enough space to download the file.',
        error: ResponseStatus.notEnoughSpace,
      );
    }

    // 4. Download the file
    final userInfo = _storage.currentUserDecrypted!;

    final result = await renterd.Object.downloadFile(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
      bucketName: fileObject.bucket,
      fileName: fileObject.name,
      onReceiveProgress: onReceiveProgress,
    );

    final resData = json.decode(result.data as String) as Map<String, dynamic>;

    final fileBytes = DataDecrypter.decryptBytesWithAES256CBC(
      chipherText: resData['data'] as String,
      key: userInfo.key,
      iv: userInfo.iv,
    );

    await _fileStorageService.saveFileBytes(
      fileBytes: fileBytes,
      fileName: fileObject.name,
      fileType: fileObject.type,
    );

    return true;
  }
}
