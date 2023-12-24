import '../../abstracts/host_abst.dart';
import '../../models/host.dart';

class GetOneHostUsecase {
  final HostAbst hostAbst;

  GetOneHostUsecase({
    required this.hostAbst,
  });

  Future<Host> call({
    required String pubKey,
  }) async {
    return await hostAbst.getOneHostByPubKey(pubKey: pubKey);
  }
}
