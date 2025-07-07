import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/security/data_decrypter.dart';
import 'package:sia_host_mobile/src/shared/services/file_storage_service.dart';
import 'package:sia_host_mobile/src/shared/services/services.dart';

@LazySingleton()
class BackupRepository {
  const BackupRepository(this._storage, this._fileStorageService);

  final StorageService _storage;
  final FileStorageService _fileStorageService;

  /// Fetch all local backups
  ///
  /// Returns a list of files
  ///
  Future<List<File>> fetchLocalBackups() async {
    final backupDir = await _fileStorageService.getBackupDir();

    if (!backupDir.existsSync()) {
      return [];
    }
    final files = backupDir.listSync().whereType<File>().toList();
    return files;
  }

  /// Delete a local backup
  ///
  Future<bool> deleteLocalBackup(File file) async {
    if (file.existsSync()) {
      await file.delete();
      return true;
    }
    return false;
  }

  /// Renterd Database Backup
  ///
  Future<File> backup() async {
    final userInfo = _storage.currentUserDecrypted!;

    final result = await Backup.backup(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
    );

    if (result['status'] == true && result.containsKey('response')) {
      final response = (result['response'] as Response<dynamic>).data as String;
      final resData = json.decode(response) as Map<String, dynamic>;

      // write the content of resData['data'] inside a result.txt file
      final backupDir = await _fileStorageService.getBackupDir();
      final resultFile = File('${backupDir.path}/result.txt');
      await resultFile.writeAsString(resData['data'] as String);

      try {
        final fileBytes = DataDecrypter.decryptBytesWithAES256CBC(
          chipherText: resData['data'] as String,
          key: userInfo.key,
          iv: userInfo.iv,
        );
        return _fileStorageService.saveBackup(
          fileBytes: fileBytes,
        );
      } catch (e) {
        log('Decrypt as filebytes');
        log('Error decrypting backup data: $e');
      }

      throw DartSiaException.handleError("result['error']");
    } else {
      throw DartSiaException.handleError(result['error']);
    }
  }

  /// Renterd Database Restore
  ///
  Future<void> restore(File file) async {
    final userInfo = _storage.currentUserDecrypted!;

    final result = await Backup.restore(
      serverAddress: userInfo.serverAddress,
      key: userInfo.key,
      iv: userInfo.iv,
      restoreFile: file,
    );

    if (result['status'] == false) {
      throw DartSiaException.handleError(result['error']);
    }
  }
}
