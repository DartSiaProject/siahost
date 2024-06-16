import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/card_of_host_entity.dart';
import '../reposit_absts/fetch_the_list_for_all_host_data_reposit_abst.dart';

@lazySingleton
class SearchTheHostByPubKeyUsecase {
  final FetchTheListForAllHostDataRepositAbst
      _fetchTheListForAllHostDataRepositAbst;

  SearchTheHostByPubKeyUsecase({
    required FetchTheListForAllHostDataRepositAbst
        fetchTheListForAllHostDataRepositAbst,
  }) : _fetchTheListForAllHostDataRepositAbst =
            fetchTheListForAllHostDataRepositAbst;

  Future<Result<List<CardOfHostEntity>, String>> call({
    required String pubKey,
  }) async =>
      await _fetchTheListForAllHostDataRepositAbst.searchHostByPubKey(
          pubKey: pubKey);
}
