import 'package:multiple_result/multiple_result.dart';

import '../entities/the_host_data_entity.dart';

abstract class FetchTheHostDataFromRenterForConfigRepositAbst {
  Future<Result<TheHostDataEntity, String>>
      fetchTheHostDataFromRenterForConfig();
}
