import 'dart:io';

extension FileEx on File {
  String get name => path.split(Platform.pathSeparator).last;
}
