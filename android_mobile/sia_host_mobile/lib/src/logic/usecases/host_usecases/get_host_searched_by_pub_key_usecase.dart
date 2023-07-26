import 'package:multiple_result/multiple_result.dart';

import '../../abstracts/host_abst.dart';
import '../../models/host.dart';

class GetHostSearchedByPubKeyUsecase {
  final HostAbst hostAbst;

  GetHostSearchedByPubKeyUsecase({
    required this.hostAbst,
  });

  Future<Result<List<Host>, String>> call({
    required String pubKey,
  }) async {
    return await hostAbst.getHostByPubKey(pubKey: pubKey);
  }
}
