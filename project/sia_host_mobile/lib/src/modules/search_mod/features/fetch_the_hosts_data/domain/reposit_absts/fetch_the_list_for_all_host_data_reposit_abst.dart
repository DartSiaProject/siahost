import 'package:multiple_result/multiple_result.dart';

import '../entities/card_of_host_entity.dart';

abstract class FetchTheListForAllHostDataRepositAbst {
  Future<Result<List<CardOfHostEntity>, String>> fetchAllTheHostsList();
  Future<Result<List<CardOfHostEntity>, String>> searchHostByPubKey({
    required String pubKey,
  });
}
