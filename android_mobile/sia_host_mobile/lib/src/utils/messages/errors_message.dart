import '../enums/errors_enum.dart';

class ErrorsMessage {
  static String error(ErrorsType error) {
    switch (error) {
      case ErrorsType.connexionError:
        return "connexion_text";

      case ErrorsType.listError:
        return "search_no_found_text";

      case ErrorsType.myHostError:
        return "my_host_no_found_text";

      case ErrorsType.loginError:
        return "make_login_demand_text";

      case ErrorsType.verificationError:
        return "credential_error_text";

      case ErrorsType.updateError:
        return "update_error_text";

      default:
        return "error_text";
    }
  }
}
