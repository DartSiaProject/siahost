import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/the_new_data_host_entity.dart';
import '../reposit_absts/update_the_hoster_with_new_data_reposit_abst.dart';

@lazySingleton
class ReconfigTheHostUsecase {
  final UpdateTheHosterWithNewDataRepositAbst
      _updateTheHosterWithNewDataRepositAbst;

  ReconfigTheHostUsecase({
    required UpdateTheHosterWithNewDataRepositAbst
        updateTheHosterWithNewDataRepositAbst,
  }) : _updateTheHosterWithNewDataRepositAbst =
            updateTheHosterWithNewDataRepositAbst;

  Future<Result<String, String>> call({
    required TheNewDataHostEntity theNewDataHostEntity,
  }) async =>
      await _updateTheHosterWithNewDataRepositAbst.updateTheHosterWithNewData(
          theNewDataHostEntity: theNewDataHostEntity);
}
