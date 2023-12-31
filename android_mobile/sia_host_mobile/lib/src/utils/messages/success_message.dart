import '../enums/success_enum.dart';

class SuccessMessage {
  static String success(SuccessType success) {
    switch (success) {
      case SuccessType.configSuccess:
        return "config_host_success_text";

      case SuccessType.verificationSuccess:
        return "credential_success_text";

      default:
        return "success";
    }
  }
}
