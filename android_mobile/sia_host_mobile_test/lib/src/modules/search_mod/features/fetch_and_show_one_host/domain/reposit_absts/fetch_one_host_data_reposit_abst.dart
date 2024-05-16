import 'package:multiple_result/multiple_result.dart';

import '../entities/host_info_entity.dart';

abstract class FetchOneHostDataRepositAbst {
  Future<Result<HostInfoEntity, String>> fetchOneHost({
    required String pubKey,
  });
}
