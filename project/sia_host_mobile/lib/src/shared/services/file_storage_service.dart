import 'dart:io';

import 'package:disk_space_plus/disk_space_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@Singleton()
class FileStorageService {
  FileStorageService();
  late String _appName;

  @PostConstruct()
  void init() {
    _appName = applicationName ?? 'DartSia';
  }

  /// Get the app download directory
  ///
  Future<Directory> getAppDownloadDir() async {
    Directory baseDir;
    if (Platform.isAndroid) {
      baseDir = Directory('/storage/emulated/0');
    } else {
      baseDir = await getApplicationDocumentsDirectory();
    }
    final appDir = Directory(p.join(baseDir.path, _appName));

    if (!appDir.existsSync()) {
      await appDir.create(recursive: true);
    }
    return appDir;
  }

  /// Get the directory for a specific file type
  ///
  Future<Directory> getTypeDir(SupportedFileType fileType) async {
    final appDir = await getAppDownloadDir();
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
    final typeDir = await getTypeDir(fileType);
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
    final typeDir = await getTypeDir(fileType);
    final destFile = File(p.join(typeDir.path, fileName));
    return destFile.writeAsBytes(fileBytes);
  }

  /// Request storage permission
  ///
  Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.manageExternalStorage.request();
      return status.isGranted;
    }
    return true;
  }

  /// rename a file
  ///
  Future<File> renameFile({
    required String oldPath,
    required String newName,
    required SupportedFileType fileType,
  }) async {
    final typeDir = await getTypeDir(fileType);
    final oldFile = File(p.join(typeDir.path, oldPath));
    final newFile = File(p.join(typeDir.path, newName));

    if (oldFile.existsSync()) {
      return oldFile.rename(newFile.path);
    } else {
      throw Exception('File not found');
    }
  }
}
