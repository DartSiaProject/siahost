import 'package:package_info_plus/package_info_plus.dart';

import '../../../shared/constants/string_const.dart';

class EnvChecker {
  static Future<String> fetchEnv() async {
    return await PackageInfo.fromPlatform().then<String>((packageInfo) {
      switch (packageInfo.packageName) {
        case "com.$organization.$app.dev":
          return "dev";
        case "com.$organization.$app.staging":
          return "staging";
        default:
          return "prod";
      }
    });
  }
}
