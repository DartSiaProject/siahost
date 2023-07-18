import '../enums/errors_enum.dart';

class ErrorsMessage {
  static String networkError(Errors errors) {
    switch (errors) {
      case Errors.connexionError:
        return "connexion_text";

      default:
        return "error_text";
    }
  }
}
