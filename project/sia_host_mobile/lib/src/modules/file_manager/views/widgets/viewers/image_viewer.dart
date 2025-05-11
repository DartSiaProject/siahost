import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:photo_view/photo_view.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({required this.filePath, super.key});
  final String filePath;

  @override
  Widget build(BuildContext context) {
    final fileName = p.basename(filePath);
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
        centerTitle: true,
      ),
      body: PhotoView(
        imageProvider: FileImage(File(filePath)),
        backgroundDecoration:
            const BoxDecoration(color: AppTheme.backgoundColor),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2,
        initialScale: PhotoViewComputedScale.contained,
      ),
    );
  }
}
