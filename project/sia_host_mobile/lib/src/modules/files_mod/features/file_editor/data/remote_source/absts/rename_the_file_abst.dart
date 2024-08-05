import 'package:http/http.dart';

abstract class RenameTheFileAbst {
  Future<Response> renameTheFile({
    required String serverAddress,
    required String password,
    required String bucketName,
    required String oldFileName,
    required String newFileName,
  });
}
