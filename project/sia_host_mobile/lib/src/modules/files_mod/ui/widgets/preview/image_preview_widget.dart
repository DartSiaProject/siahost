import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';
import 'package:sia_host_mobile/src/shared/extensions/file_ext.dart';

class ImagePreviewWidget extends StatelessWidget {
  final FileEntity file;

  const ImagePreviewWidget({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: FileImage(File(file.downloadedPath)),
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 2,
    );
  }
}
