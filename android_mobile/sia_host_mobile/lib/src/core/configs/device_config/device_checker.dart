import 'package:flutter/material.dart';

class DeviceChecker {
  static bool checkDeviceType(BuildContext context) {
    MediaQueryData data = MediaQueryData.fromView(View.of(context));
    double shortestSide = data.size.shortestSide;
    if (shortestSide < 600) {
      return true;
    } else {
      return false;
    }
  }
}
