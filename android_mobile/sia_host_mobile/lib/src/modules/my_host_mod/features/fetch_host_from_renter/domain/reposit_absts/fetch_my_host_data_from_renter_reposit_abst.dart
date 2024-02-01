import 'package:multiple_result/multiple_result.dart';

import '../entities/my_host_data_entity.dart';

abstract class FetchMyHostDataFromRenterRepositAbst {
  Future<Result<MyHostDataEntity, String>> fetchTheHostDataFromRenter();
}
