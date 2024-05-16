import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/my_host_data_entity.dart';
import '../reposit_absts/fetch_my_host_data_from_renter_reposit_abst.dart';

@lazySingleton
class FetchMyHostFromRenterUsecase {
  final FetchMyHostDataFromRenterRepositAbst
      _fetchMyHostDataFromRenterRepositAbst;

  FetchMyHostFromRenterUsecase({
    required FetchMyHostDataFromRenterRepositAbst
        fetchMyHostDataFromRenterRepositAbst,
  }) : _fetchMyHostDataFromRenterRepositAbst =
            fetchMyHostDataFromRenterRepositAbst;

  Future<Result<MyHostDataEntity, String>> call() async =>
      await _fetchMyHostDataFromRenterRepositAbst.fetchTheHostDataFromRenter();
}
