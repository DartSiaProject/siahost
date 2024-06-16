import 'package:http/http.dart';

abstract class FetchAllExistantHostsAbst {
  Future<Response> fetchAllHosts();
}
