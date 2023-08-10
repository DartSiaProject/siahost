import '../enums/errors_enum.dart';

class ErrorsMessage {
  static String error(Errors error) {
    switch (error) {
      case Errors.connexionError:
        return "connexion_text";

      case Errors.listError:
        return "search_no_found_text";

      case Errors.myHostError:
        return "my_host_no_found_text";

      default:
        return "error_text";
    }
  }
}
