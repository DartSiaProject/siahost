import 'package:http/http.dart';

abstract class FetchConsensusFromRenterAbst {
  Future<Response> fetchTheConsensus({
    required String serverAddress,
    required String password,
  });
}
