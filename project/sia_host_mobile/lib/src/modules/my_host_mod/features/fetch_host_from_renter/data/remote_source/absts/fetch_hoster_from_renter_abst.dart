import 'package:http/http.dart';

abstract class FetchHosterFromRenterAbst {
  Future<Response> fetchTheHoster({
    required String serverAddress,
    required String password,
  });
}
