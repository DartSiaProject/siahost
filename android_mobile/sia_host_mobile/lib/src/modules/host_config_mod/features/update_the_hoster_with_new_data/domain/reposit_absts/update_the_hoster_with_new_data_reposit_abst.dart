import 'package:multiple_result/multiple_result.dart';

import '../entities/the_new_data_host_entity.dart';

abstract class UpdateTheHosterWithNewDataRepositAbst {
  Future<Result<String, String>> updateTheHosterWithNewData({
    required TheNewDataHostEntity theNewDataHostEntity,
  });
}
