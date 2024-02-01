import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/the_host_data_entity.dart';
import '../reposit_absts/fetch_the_host_data_from_renter_for_config_reposit_abst.dart';

@lazySingleton
class FetchTheHosterForConfigUsecase {
  final FetchTheHostDataFromRenterForConfigRepositAbst
      _fetchTheHostDataFromRenterForConfigRepositAbst;

  FetchTheHosterForConfigUsecase({
    required FetchTheHostDataFromRenterForConfigRepositAbst
        fetchTheHostDataFromRenterForConfigRepositAbst,
  }) : _fetchTheHostDataFromRenterForConfigRepositAbst =
            fetchTheHostDataFromRenterForConfigRepositAbst;

  Future<Result<TheHostDataEntity, String>> call() =>
      _fetchTheHostDataFromRenterForConfigRepositAbst
          .fetchTheHostDataFromRenterForConfig();
}
