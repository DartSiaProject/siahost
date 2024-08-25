abstract class FetchConsensusFromRenterAbst {
  Future<Map<String, dynamic>> fetchTheConsensus({
    required String serverAddress,
    required String password,
  });
}
