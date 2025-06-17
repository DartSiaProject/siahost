import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/modules/host_config/data/models/dto/host_config_dto.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';

@Injectable()
class HostConfigRepository {
  HostConfigRepository(this._storage);

  final StorageService _storage;

  Future<void> updateHost(HostConfigDto dto) async {
    try {
      final userInfo = _storage.currentUserDecrypted!;

      final result = await Hoster.updateSomeHost(
        hostConfig: dto.toJson(),
        serverAddress: userInfo.serverAddress,
        key: userInfo.key,
        iv: userInfo.iv,
      );

      if (result['status'] == true && result.containsKey('response')) {
        return;
      } else {
        throw DartSiaException.handleError(result['error']);
      }
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }
}
