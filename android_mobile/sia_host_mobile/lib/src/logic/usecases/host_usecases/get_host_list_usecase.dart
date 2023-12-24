import 'package:multiple_result/multiple_result.dart';

import '../../abstracts/host_abst.dart';
import '../../models/host.dart';

class GetHostDataListUsecase {
  final HostAbst hostAbst;

  GetHostDataListUsecase({
    required this.hostAbst,
  });

  Future<Result<List<Host>, String>> call() async {
    return await hostAbst.getHostDataList();
  }
}
