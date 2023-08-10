import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/logic/models/host_setting.dart';

import '../../abstracts/host_abst.dart';

class UpdateSomeHostFromRenterdUsecase {
  final HostAbst hostAbst;

  UpdateSomeHostFromRenterdUsecase({
    required this.hostAbst,
  });

  Future<Result<String, String>> call({
    required HostSetting hostSetting,
  }) async {
    return await hostAbst.updateSomeHostFromRenterd(hostSetting: hostSetting);
  }
}
