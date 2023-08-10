import 'package:sia_host_mobile/src/utils/enums/success_enum.dart';

class SuccessMessage {
  static String success(SuccessType success) {
    switch (success) {
      case SuccessType.configSuccess:
        return "config_host_success_text";

      default:
        return "success";
    }
  }
}
