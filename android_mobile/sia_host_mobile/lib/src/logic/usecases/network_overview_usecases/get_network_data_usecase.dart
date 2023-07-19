import 'package:multiple_result/multiple_result.dart';

import '../../abstracts/network_abst.dart';

class GetNetworkDataUsecase {
  final NetworkAbst networkOverviewAbst;

  const GetNetworkDataUsecase({
    required this.networkOverviewAbst,
  });

  Future<Result<Map<String, dynamic>, String>> call() async {
    return await networkOverviewAbst.getNetworkData();
  }
}
