import 'package:flutter/material.dart';

import '../../constants/double_const.dart';
import 'device_helper.dart';

class SizeConfigHelper {
  static Future<Size> sizeScreen(BuildContext context) async {
    if (await DeviceHelper.deviceTypeChecker(context))
      return const Size(phoneWidthScreen, phoneHeightScreen);
    return const Size(tabletWidthScreen, tabletHeightScreen);
  }
}
