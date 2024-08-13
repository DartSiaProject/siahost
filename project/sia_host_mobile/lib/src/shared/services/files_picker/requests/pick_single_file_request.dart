import 'package:file_picker/file_picker.dart';

class PickSingleFileRequest {
  static Future<Map<String, dynamic>> pickOneFile() async {
    return await FilePicker.platform
        .pickFiles()
        .then((FilePickerResult? result) {
      if (result != null) {
        return {
          "status": true,
          "data": result.files.single.path!,
        };
      } else {
        return {
          "status": false,
        };
      }
    });
  }
}
