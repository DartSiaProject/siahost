import 'package:device_info_plus/device_info_plus.dart';

class AndroidRequest {
  static Future<int> version() async {
    var _androidInfo = await DeviceInfoPlugin().androidInfo;
    var _release = _androidInfo.version.release;
    return int.parse(_release);
  }
}
