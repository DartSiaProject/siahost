import 'package:permission_handler/permission_handler.dart';

class PermissionRequest {
  static Future<bool> requestPermissionAndResult({
    required Permission permissionType,
  }) async {
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
  }
}
