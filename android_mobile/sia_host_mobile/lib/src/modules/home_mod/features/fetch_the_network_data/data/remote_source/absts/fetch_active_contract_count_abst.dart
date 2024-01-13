import 'package:http/http.dart';

abstract class FetchActiveContractCountAbst {
  Future<Response> fetchAllActiveContractCount();
}
