import 'package:multiple_result/multiple_result.dart';

import '../models/host.dart';

abstract class NetworkAbst {
  Future<Result<List<Host>, String>> getAllHosts();
}
