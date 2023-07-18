import 'package:multiple_result/multiple_result.dart';

import '../../abstracts/network_abst.dart';
import '../../models/host.dart';

class GetAllHostsUsecase {
  final NetworkAbst networkOverviewAbst;

  const GetAllHostsUsecase({
    required this.networkOverviewAbst,
  });

  Future<Result<List<Host>, String>> call() async {
    return await networkOverviewAbst.getAllHosts();
  }
}
