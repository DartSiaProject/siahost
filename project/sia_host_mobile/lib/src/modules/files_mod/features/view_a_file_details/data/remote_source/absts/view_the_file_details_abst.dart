import 'package:http/http.dart';

abstract class ViewTheFileDetailsAbst {
  Future<Response> viewTheDetailsFile({
    required String serverAddress,
    required String password,
    required String fileName,
    required String bucketName,
  });
}
