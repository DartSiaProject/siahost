import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/host_info_entity.dart';
import '../reposit_absts/fetch_one_host_data_reposit_abst.dart';

@lazySingleton
class FetchOneHostInfoDataUsecase {
  final FetchOneHostDataRepositAbst _fetchOneHostDataRepositAbst;

  FetchOneHostInfoDataUsecase({
    required FetchOneHostDataRepositAbst fetchOneHostDataRepositAbst,
  }) : _fetchOneHostDataRepositAbst = fetchOneHostDataRepositAbst;

  Future<Result<HostInfoEntity, String>> call({
    required String pubKey,
  }) async =>
      await _fetchOneHostDataRepositAbst.fetchOneHost(pubKey: pubKey);
}
