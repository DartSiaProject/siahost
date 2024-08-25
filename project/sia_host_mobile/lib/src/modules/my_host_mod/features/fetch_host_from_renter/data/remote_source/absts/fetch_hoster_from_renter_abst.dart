abstract class FetchHosterFromRenterAbst {
  Future<Map<String, dynamic>> fetchTheHoster({
    required String serverAddress,
    required String password,
  });
}
