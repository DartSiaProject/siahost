import 'package:sia_host_mobile/src/modules/file_manager/data/models/models.dart';

class BucketObjectHelper {
  BucketObjectHelper._();

  /// Get all objects at the given prefix
  ///
  static List<BucketObjectModel> getObjectsAtPrefix(
    List<BucketObjectModel> allObjects,
    String? prefix,
  ) {
    final currentPrefix = (prefix ?? '').isEmpty ? '' : prefix!;
    final folderNames = <String>{};
    final folders = <BucketObjectModel>[];
    final files = <BucketObjectModel>[];

    for (final object in allObjects) {
      if (object.key == currentPrefix) continue;

      if (object.isFolder) {
        final relative = object.key.substring(currentPrefix.length);
        if (relative.isEmpty) continue;
        if (!relative.contains('/')) continue;
        final folderName = relative.split('/').first;
        final folderKey = '$currentPrefix$folderName/';
        if (!folderNames.contains(folderKey)) {
          folders.add(
            BucketObjectModel(
              bucket: object.bucket,
              key: folderKey,
              size: 0,
              etag: '',
              health: 1,
              modTime: object.modTime,
              isFolder: true,
              mimeType: object.mimeType,
            ),
          );
          folderNames.add(folderKey);
        }
      } else {
        final relative = object.key.substring(currentPrefix.length);
        if (!relative.contains('/')) {
          files.add(object);
        }
      }
    }

    folders.sort((a, b) => a.name.compareTo(b.name));
    files.sort((a, b) => a.name.compareTo(b.name));

    return [...folders, ...files];
  }
}
