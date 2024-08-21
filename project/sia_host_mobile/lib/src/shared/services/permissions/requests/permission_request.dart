import 'package:permission_handler/permission_handler.dart';
import 'package:sia_host_mobile/src/shared/services/deviceInfos/requests/android_request.dart';

class PermissionRequest {
  static Future<bool> requestPermissionAndResult({
    required Permission permissionType,
  }) async {
    if (await AndroidRequest.version() < 13) {
      return await permissionType.status.then((_permissionStatus) async {
        if (_permissionStatus.isGranted) {
          return true;
        } else {
          return await permissionType.request().then((_permissionStatus) {
            if (_permissionStatus.isGranted) {
              return true;
            } else {
              return false;
            }
          });
        }
      });
    } else {
      return true;
    }
  }
}
