import 'package:http/http.dart';

abstract class FetchHosterFromRenterForConfigAbst {
  Future<Response> fetchTheHosterForConfiguration({
    required String serverAddress,
    required String password,
  });
}
