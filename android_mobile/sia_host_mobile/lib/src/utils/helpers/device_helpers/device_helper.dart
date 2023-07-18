import 'package:flutter/material.dart';

class DeviceHelper {
  static Future<bool> deviceTypeChecker(BuildContext context) async {
    MediaQueryData data = MediaQueryData.fromView(View.of(context));
    double shortestSide = data.size.shortestSide;
    if (shortestSide < 600) return true;
    return false;
  }
}
