import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';
import 'package:sia_host_mobile/src/shared/extensions/file_ext.dart';

class TextPreviewWidget extends StatelessWidget {
  final FileEntity file;

  const TextPreviewWidget({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: File(file.downloadedPath).readAsString(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading file'));
        }
        return SingleChildScrollView(
          child: Text(snapshot.data ?? ''),
        );
      },
    );
  }
}
