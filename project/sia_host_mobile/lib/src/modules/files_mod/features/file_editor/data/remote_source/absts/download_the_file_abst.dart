import 'package:http/http.dart';

abstract class DownloadTheFileAbst {
  Future<Response> downloadTheFile({
    required String serverAddress,
    required String password,
    required String fileName,
    required String bucketName,
  });
}
