import 'package:flutter/foundation.dart';
import '../configs/connection_instance.dart';

class ConnectionRequest {
  static Future<bool> checkConnectivity() async {
    return kDebugMode ? true : await internetConnectivity.hasInternetAccess;
  }
}
