import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionRequest {
  static var _connectivity = Connectivity();

  static Future<bool> checkConnectivity() async {
    return await _connectivity.checkConnectivity().then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    });
  }
}
