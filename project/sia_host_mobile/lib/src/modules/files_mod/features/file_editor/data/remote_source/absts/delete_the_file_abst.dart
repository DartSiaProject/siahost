import 'package:http/http.dart';

abstract class DeleteTheFileAbst {
  Future<Response> deleteTheFile({
    required String serverAddress,
    required String password,
    required String fileName,
    required String bucketName,
  });
}
