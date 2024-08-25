abstract class FetchHosterFromRenterForConfigAbst {
  Future<Map<String, dynamic>> fetchTheHosterForConfiguration({
    required String serverAddress,
    required String password,
  });
}
