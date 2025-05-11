import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:renterd/renterd.dart' as renterd;
import 'package:sia_host_mobile/src/modules/auth/data/models/user_info.dart';
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
    // Request permission
    await _requestStoragePermission();

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
      destfileName: destfileName + sourcefile.extension,
    );

    if (result['status'] == true && result.containsKey('response')) {
      return;
    } else {
      throw DartSiaException.handleError(result['error']);
    }
  }

  /// Rename File
  ///
  Future<String> renameFile({
    required BucketObjectModel file,
    required String newFileName,
  }) async {
    newFileName += file.extension;

    // Request permission
    await _requestStoragePermission();

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
      return newFileName;
    } else {
      throw DartSiaException.handleError(result['error']);
    }
  }

  /// Delete File
  ///
  Future<void> deleteFile({
    required BucketObjectModel file,
  }) async {
    // Request permission
    await _requestStoragePermission();

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
    // Request permission
    await _requestStoragePermission();

    final userInfo = _storage.currentUserDecrypted!;
    try {
      final res = await renterd.Object.uploadFile(
        serverAddress: userInfo.serverAddress,
        key: userInfo.key,
        iv: userInfo.iv,
        bucketName: bucketName,
        fileName: fileName,
        file: file,
        onSendProgress: onSendProgress,
      );

      Logger().f(res);
    } catch (e) {
      Logger().w(e);

      if (e is DioException) {
        if (e.response != null) {
          final resData = e.response!.data as Map<String, dynamic>;
          if (resData.containsKey('data')) {
            final errorData = resData['data'] as String;
            final decodedError = DataDecrypter.decryptStringWithAES256CBC(
              chipherText: errorData,
              key: userInfo.key,
              iv: userInfo.iv,
            );
            throw DartSiaException(
              decodedError,
              error: ResponseStatus.unknown,
            );
          }
        }
      }

      rethrow;
    }
  }

  /// Download a file from a bucket
  ///
  Future<bool> downloadFile({
    required String bucket,
    required String fileName,
    required int size,
    required String saveAs,
    required String fileType,
    String? encodedUserInfo,
    void Function(int received, int total)? onReceiveProgress,
  }) async {
    UserInfo userInfo;
    if (encodedUserInfo != null) {
      userInfo = _storage.decryptUserString(encodedUserInfo);
    } else {
      userInfo = _storage.currentUserDecrypted!;
    }

    final result = await renterd.Object.downloadTheObject(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
      bucketName: bucket,
      fileName: fileName,
      onReceiveProgress: onReceiveProgress,
    );

    if (result['status'] == true && result.containsKey('response')) {
      final response = result['response'] as Response;

      final resData =
          json.decode(response.data as String) as Map<String, dynamic>;

      final fileBytes = DataDecrypter.decryptBytesWithAES256CBC(
        chipherText: resData['data'] as String,
        key: userInfo.key,
        iv: userInfo.iv,
      );

      await _fileStorageService.saveFileBytes(
        fileBytes: fileBytes,
        fileName: saveAs,
        fileType: SupportedFileType.values.firstWhere(
          (e) => e.name == fileType,
          orElse: () => SupportedFileType.other,
        ),
      );
    } else {
      throw DartSiaException.handleError(result['error']);
    }

    return true;
  }

  /// Request storage permission
  ///
  Future<void> _requestStoragePermission() async {
    final result = await _fileStorageService.requestStoragePermission();
    if (!result) {
      throw const DartSiaException(
        'Please accept storage permission first.',
        error: ResponseStatus.noStoragePermission,
      );
    }
  }

  /// Check if a file can be opened
  ///
  /// by checking if the file exists in the local storage
  /// and return the path to the file
  ///
  Future<String?> canOpenFile(BucketObjectModel fileObject) async {
    final localFile = await _fileStorageService.fileExists(
      fileName: fileObject.key,
      fileType: fileObject.type,
    );

    if (localFile != null) {
      return localFile.path;
    } else {
      return null;
    }
  }
}
