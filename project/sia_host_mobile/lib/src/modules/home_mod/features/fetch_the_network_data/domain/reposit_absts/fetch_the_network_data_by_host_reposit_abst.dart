import 'package:multiple_result/multiple_result.dart';

import '../entities/network_data_entity.dart';

abstract class FetchTheNetworkDataByHostRepositAbst {
  Future<Result<NetworkDataEntity, String>> fetchAllHostCurrents();
}
