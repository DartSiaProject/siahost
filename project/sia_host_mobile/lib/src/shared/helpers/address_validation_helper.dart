import '../constants/string_const.dart';

class AddressValidationHelper {
  static bool hasValidAddress({
    required String address,
  }) {
    return RegExp(urlPattern, caseSensitive: false).hasMatch(address);
  }
}
