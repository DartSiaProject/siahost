import 'dart:io';

import '../../../constants/string_const.dart';

class SaveFileRequest {
  static Future<Map<String, dynamic>> saveTheFileDownloaded({
    required String fileNameWithExtension,
    required List<int> fileBytes,
  }) async {
    Directory? downloadsDirectory = Directory(storageDownload);

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
