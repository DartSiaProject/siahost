import 'package:multiple_result/multiple_result.dart';

import '../models/host.dart';

abstract class HostAbst {
  Future<Result<List<Host>, String>> getHostDataList();
  Future<Result<List<Host>, String>> getHostByPubKey({
    required String pubKey,
  });
}
