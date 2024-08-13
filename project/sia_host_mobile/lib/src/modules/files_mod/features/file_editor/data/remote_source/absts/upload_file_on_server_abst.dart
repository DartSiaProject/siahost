import 'dart:io';

import 'package:http/http.dart';

abstract class UploadFileOnServerAbst {
  Future<Response> uploadTheFile({
    required String serverAddress,
    required String password,
    required String bucketName,
    required String fileName,
    required File file,
  });
}
