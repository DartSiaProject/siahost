import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';

class AndroidRequest {
  AndroidRequest._();

  static Future<int> version() async {
    var _androidInfo = await DeviceInfoPlugin().androidInfo;
    var _release = _androidInfo.version.release.split('.').first;

    log('Android version: $_release');
    // return int.tryParse(_release) ?? 0;
    return 15;
  }
}
