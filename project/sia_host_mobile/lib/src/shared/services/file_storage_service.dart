import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:disk_space_plus/disk_space_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@Singleton()
class FileStorageService {
  FileStorageService();

  /// Get the app download directory
  ///
  Future<Directory> _getAppDownloadDir(String appName) async {
    Directory baseDir;
    if (Platform.isAndroid) {
      baseDir = await getExternalStorageDirectory() ??
          (await getApplicationDocumentsDirectory());
    } else {
      baseDir = await getApplicationDocumentsDirectory();
    }
    final appDir = Directory(p.join(baseDir.path, appName));

    if (!appDir.existsSync()) {
      await appDir.create(recursive: true);
    }
    return appDir;
  }

  /// Get the directory for a specific file type
  ///
  Future<Directory> _getTypeDir(SupportedFileType fileType) async {
    final appDir = await _getAppDownloadDir(applicationName);
    final typeDir = Directory(p.join(appDir.path, fileType.dirName));

    if (!typeDir.existsSync()) {
      await typeDir.create(recursive: true);
    }
    return typeDir;
  }

  /// Check if there is enough space to save a file
  ///
  Future<bool> hasEnoughSpace(int fileSizeBytes) async {
    final freeSpace = await DiskSpacePlus.getFreeDiskSpace;
    if (freeSpace == null) return false;

    // freeSpace is in MB
    return freeSpace * 1024 * 1024 > fileSizeBytes;
    // return true;
  }

  /// Save a file to the specified directory
  ///
  Future<File> saveFile({
    required File sourceFile,
    required String fileName,
    required SupportedFileType fileType,
  }) async {
    final typeDir = await _getTypeDir(fileType);
    final destFile = File(p.join(typeDir.path, fileName));
    return sourceFile.copy(destFile.path);
  }

  /// Save a fileBytes to the specified directory
  ///
  Future<File> saveFileBytes({
    required List<int> fileBytes,
    required String fileName,
    required SupportedFileType fileType,
  }) async {
    final typeDir = await _getTypeDir(fileType);
    final destFile = File(p.join(typeDir.path, fileName));
    return destFile.writeAsBytes(fileBytes);
  }

  /// Request storage permission
  ///
  Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      final androidVersion = await DeviceInfoPlugin().androidInfo;
      if (androidVersion.version.sdkInt >= 33) {
        return true;
      } else {
        final status = await Permission.storage.request();
        return status.isGranted;
      }
    }
    return true;
  }

  /// rename a file
  Future<File> renameFile({
    required String oldPath,
    required String newName,
    required SupportedFileType fileType,
  }) async {
    final oldFile = await fileExists(fileName: oldPath, fileType: fileType);

    if (oldFile == null) {
      throw Exception('File not found');
    }

    final path = oldFile.path;
    final lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    final newPath = path.substring(0, lastSeparator + 1) + newName;
    return oldFile.rename(newPath);

    // return oldFile.rename(newName);
  }

  /// Check if a file exists
  ///
  /// in local storage
  Future<File?> fileExists({
    required String fileName,
    required SupportedFileType fileType,
  }) async {
    final typeDir = await _getTypeDir(fileType);
    final file = File(p.join(typeDir.path, fileName));

    if (file.existsSync()) {
      return file;
    } else {
      return null;
    }
  }
}
