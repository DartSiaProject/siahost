import 'package:multiple_result/multiple_result.dart';

import '../../abstracts/host_abst.dart';
import '../../models/host_setting.dart';

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
