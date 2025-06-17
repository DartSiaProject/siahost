import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({required this.filePath, super.key});
  final String filePath;

  Future<void> _sharePdf() async {
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(filePath)],
        text: 'Check out this PDF: $fileName',
      ),
    );
  }

  String get fileName => p.basename(filePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: _sharePdf,
          ),
        ],
      ),
      body: SfPdfViewer.file(
        File(filePath),
        pageSpacing: 8,
      ),
    );
  }
}
