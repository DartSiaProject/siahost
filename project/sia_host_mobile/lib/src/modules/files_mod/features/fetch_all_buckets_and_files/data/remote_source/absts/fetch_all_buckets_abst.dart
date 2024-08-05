import 'package:http/http.dart';

abstract class FetchAllBucketsAbst {
  Future<Response> fetchListOfBucket({
    required String serverAddress,
    required String password,
  });
}
