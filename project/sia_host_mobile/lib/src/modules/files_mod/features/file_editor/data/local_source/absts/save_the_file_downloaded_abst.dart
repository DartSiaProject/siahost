import 'package:flutter/services.dart';

abstract class SaveTheFileDownloadedAbst {
  Future<Map<String, dynamic>> saveTheFileDownload({
    required String fileNameWithExtension,
    required Uint8List fileBytes,
  });
}
