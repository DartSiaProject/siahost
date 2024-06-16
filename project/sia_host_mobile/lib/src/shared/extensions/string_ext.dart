import '../constants/string_const.dart';

extension StringExtensions on String {
  bool hasValidAddress() {
    return RegExp(urlPattern, caseSensitive: false).hasMatch(this);
  }
}
