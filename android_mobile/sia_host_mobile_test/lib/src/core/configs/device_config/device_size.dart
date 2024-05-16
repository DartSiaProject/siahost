import 'package:flutter/material.dart';

import '../../../shared/constants/double_const.dart';
import 'device_checker.dart';

class DeviceSize {
  static Size fetchScreenSize(BuildContext context) {
    if (DeviceChecker.checkDeviceType(context)) {
      return const Size(phoneWidthScreen, phoneHeightScreen);
    } else {
      return const Size(tabletWidthScreen, tabletHeightScreen);
    }
  }
}
