import 'dart:io';

abstract class UploadFileOnServerAbst {
  Future<Map<String, dynamic>> uploadTheFile({
    required String serverAddress,
    // required String password,
    required String bucketName,
    required String fileName,
    required File file,
    required String key,
    required String iv,
  });
}
