import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';
import 'package:sia_host_mobile/src/shared/extensions/file_ext.dart';

class PdfPreviewWidget extends StatelessWidget {
  final FileEntity file;

  const PdfPreviewWidget({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return PdfViewPinch(
      controller: PdfControllerPinch(
        document: PdfDocument.openFile(file.downloadedPath),
      ),
    );
  }
}
