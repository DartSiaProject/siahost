import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/logic/models/host_setting.dart';

import '../../abstracts/host_abst.dart';

class GetSomeHostFromRenterdUsecase {
  final HostAbst hostAbst;

  GetSomeHostFromRenterdUsecase({
    required this.hostAbst,
  });

  Future<Result<HostSetting, String>> call() async {
    return await hostAbst.getSomeHostFromRenterd();
  }
}
