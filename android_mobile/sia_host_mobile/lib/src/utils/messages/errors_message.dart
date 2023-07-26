import '../enums/errors_enum.dart';

class ErrorsMessage {
  static String networkError(Errors errors) {
    switch (errors) {
      case Errors.connexionError:
        return "search_no_found_text";

      default:
        return "error_text";
    }
  }

  static String hostError(Errors errors) {
    switch (errors) {
      case Errors.listError:
        return "search_no_found_text";

      default:
        return "error_text";
    }
  }
}
