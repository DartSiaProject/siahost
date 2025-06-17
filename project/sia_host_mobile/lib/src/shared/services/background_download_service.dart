import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/repositories/file_action_repository.dart';
import 'package:sia_host_mobile/src/shared/services/notification_service.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';
import 'package:workmanager/workmanager.dart';

/// Simple file‐based storage for a JSON Set<String> and an int counter.
///
class _FileStore {
  _FileStore(String dirPath, String basename)
      : _setFile = File('$dirPath/$basename.json'),
        _idFile = File('$dirPath/.$basename._id');
  final File _setFile;
  final File _idFile;

  /// Read a Set<String>, clearing bad JSON on error.
  ///
  Future<Set<String>> readSet() async {
    try {
      if (!_setFile.existsSync()) return {};
      final raw = await _setFile.readAsString();
      final list = (json.decode(raw) as List).cast<String>();
      return list.toSet();
    } on FormatException {
      // corrupted → reset
      await writeSet(<String>{});
      return {};
    } catch (e) {
      return {};
    }
  }

  Future<void> writeSet(Set<String> data) =>
      _setFile.writeAsString(json.encode(data.toList()));

  /// Bump & return next int, clearing bad data on error.
  ///
  Future<int> nextId() async {
    var last = 0;
    try {
      if (_idFile.existsSync()) {
        last = int.parse(await _idFile.readAsString());
      }
    } catch (_) {
      last = 0;
    }
    final next = last + 1;
    await _idFile.writeAsString('$next');
    return next;
  }
}

class BackgroundDownloadService {
  BackgroundDownloadService._();
  static final _notification = NotificationService();

  /// Enqueue a download: records active, passes `storageDir` to background.
  static Future<bool> enqueueDownload({
    required BucketObjectModel fileObject,
    required String encodedUserInfo,
  }) async {
    // 1) get app dir and storage helper
    final appDir = (await getApplicationDocumentsDirectory()).path;
    final store = _FileStore(appDir, 'active_downloads');

    // 2) read & guard active set
    final active = await store.readSet();
    final fileId = fileObject.name.replaceAll(' ', '_');
    if (active.contains(fileId)) return false;
    active.add(fileId);

    try {
      // 3) schedule task with storageDir
      await Workmanager().registerOneOffTask(
        'download_$fileId',
        'background_download',
        inputData: {
          'storageDir': appDir,
          'bucket': fileObject.bucket,
          'size': fileObject.size,
          'fileName': fileObject.key,
          'saveAs': fileObject.name,
          'fileType': fileObject.type.name,
          'encodedUserInfo': encodedUserInfo,
        },
        constraints: Constraints(networkType: NetworkType.connected),
      );

      // 4) persist updated active set
      await store.writeSet(active);
      return true;
    } catch (e) {
      // undo on failure
      active.remove(fileId);
      await store.writeSet(active);
      rethrow;
    }
  }

  /// This is the Workmanager callback handler for
  /// background_download tasks.
  ///
  static Future<void> handleBackgroundDownload(
    Map<String, dynamic> inputData,
  ) async {
    final storageDir = inputData['storageDir'] as String;
    final bucket = inputData['bucket'] as String;
    final fileName = inputData['fileName'] as String;
    final saveAs = inputData['saveAs'] as String;
    final size = inputData['size'] as int;
    final fileType = inputData['fileType'] as String;

    final fileId = saveAs.replaceAll(' ', '_');
    final store = _FileStore(storageDir, 'active_downloads');

    // 1) bump notification ID
    final notifId = await store.nextId();

    // 2) read active
    final active = await store.readSet();

    try {
      // 3) start notification
      await _notification.showDownloadNotification(
        id: notifId,
        title: 'Downloading',
        body: 'Starting $fileName',
      );

      // 4) perform actual download & update progress
      await di.get<FileActionRepository>().downloadFile(
            bucket: bucket,
            fileName: fileName,
            size: size,
            saveAs: saveAs,
            fileType: fileType,
            encodedUserInfo: inputData['encodedUserInfo'] as String,
            onReceiveProgress: (received, total) async {
              final receivedMB = (received / 1024 / 1024).toStringAsFixed(2);
              await NotificationService().showDownloadNotification(
                id: notifId,
                title: saveAs,
                body: '$receivedMB MB',
                // progress: progress,
              );
            },
          );

      // 5) done
      await _notification.showPushNotification(
        id: notifId,
        title: 'Download Complete',
        body: '$saveAs ready',
      );
    } catch (e) {
      await _notification.showPushNotification(
        id: notifId,
        title: 'Download Failed',
        body: 'Could not download $saveAs',
      );
    } finally {
      // 6) remove from active set
      active.remove(fileId);
      await store.writeSet(active);
    }
  }
}
