import 'dart:math';

class CalculatorHelper {
  static String getFileSize(int fileSize, int decimals) {
    int bytes = fileSize;
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1000)).floor();
    return '${(bytes / pow(1000, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
