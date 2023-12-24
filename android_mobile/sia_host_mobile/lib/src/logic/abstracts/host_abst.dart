import 'package:multiple_result/multiple_result.dart';

import '../models/host.dart';
import '../models/host_setting.dart';

abstract class HostAbst {
  Future<Result<List<Host>, String>> getHostDataList();
  Future<Result<List<Host>, String>> getHostByPubKey({required String pubKey});
  Future<Host> getOneHostByPubKey({required String pubKey});
  Future<Result<HostSetting, String>> getSomeHostFromRenterd();
  Future<Result<String, String>> updateSomeHostFromRenterd({
    required HostSetting hostSetting,
  });
}
