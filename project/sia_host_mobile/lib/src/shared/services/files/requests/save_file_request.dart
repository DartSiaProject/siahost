import 'dart:io';

import 'package:flutter/services.dart';

class SaveFileRequest {
  static Future<Map<String, dynamic>> saveTheFileDownloaded({
    required String fileNameWithExtension,
    required Uint8List fileBytes,
  }) async {
    Directory? downloadsDirectory = Directory('/storage/emulated/0/Download');

    var filePath = '${downloadsDirectory.path}/$fileNameWithExtension';
    var file = File(filePath);
    return await file.writeAsBytes(fileBytes).then((_file) {
      if (_file.path.isNotEmpty) {
        return {
          "status": true,
          "data": _file,
        };
      } else {
        return {
          "status": false,
        };
      }
    });
  }
}
