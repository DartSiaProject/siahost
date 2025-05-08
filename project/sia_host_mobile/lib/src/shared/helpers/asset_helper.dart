import 'package:flutter/widgets.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

class AssetHelper {
  AssetHelper._();

  static Widget getfileObjectWidget(
    BucketObjectModel fileObject, {
    double height = 50,
  }) {
    var asset = 'assets/images/file_exts/';

    switch (fileObject.type) {
      case SupportedFileType.video:
        asset += 'video.png';
      case SupportedFileType.audio:
        asset += 'audio.png';
      case SupportedFileType.image:
        asset += 'image.png';
      case SupportedFileType.document:
        asset += 'document.png';
      case SupportedFileType.pdf:
        asset += 'pdf.png';
      case SupportedFileType.txt:
        asset += 'txt.png';
      case SupportedFileType.archive:
        asset += 'archive.png';
      case SupportedFileType.other:
        asset += 'unknown.png';
    }

    return Image.asset(
      asset,
      height: height,
    );
  }
}
