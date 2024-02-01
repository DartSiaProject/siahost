import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/card_of_host_entity.dart';
import '../reposit_absts/fetch_the_list_for_all_host_data_reposit_abst.dart';

@lazySingleton
class FetchAllTheHostUsecase {
  final FetchTheListForAllHostDataRepositAbst
      _fetchTheListForAllHostDataRepositAbst;

  FetchAllTheHostUsecase({
    required FetchTheListForAllHostDataRepositAbst
        fetchTheListForAllHostDataRepositAbst,
  }) : _fetchTheListForAllHostDataRepositAbst =
            fetchTheListForAllHostDataRepositAbst;

  Future<Result<List<CardOfHostEntity>, String>> call() async =>
      await _fetchTheListForAllHostDataRepositAbst.fetchAllTheHostsList();
}
