import 'package:multiple_result/multiple_result.dart';

import '../../abstracts/host_abst.dart';
import '../../models/host_setting.dart';

class GetSomeHostFromRenterdUsecase {
  final HostAbst hostAbst;

  GetSomeHostFromRenterdUsecase({
    required this.hostAbst,
  });

  Future<Result<HostSetting, String>> call() async {
    return await hostAbst.getSomeHostFromRenterd();
  }
}
