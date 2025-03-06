import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/network_data_entity.dart';
import '../reposit_absts/fetch_the_network_data_by_host_reposit_abst.dart';

@lazySingleton
class UserFetchTheNetworkDataUsecase {
  final FetchTheNetworkDataByHostRepositAbst
      _fetchTheNetworkDataByHostRepositAbst;

  UserFetchTheNetworkDataUsecase({
    required FetchTheNetworkDataByHostRepositAbst
        fetchTheNetworkDataByHostRepositAbst,
  }) : _fetchTheNetworkDataByHostRepositAbst =
            fetchTheNetworkDataByHostRepositAbst;

  Future<Result<NetworkDataEntity, String>> call() async =>
      await _fetchTheNetworkDataByHostRepositAbst.fetchAllHostCurrents();
}
