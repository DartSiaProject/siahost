import 'dart:io';

import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';
import 'package:sia_host_mobile/src/shared/helpers/file_manager_helper.dart';

import '../constants/string_const.dart';

extension FileEx on File {
  String get name => path.split(Platform.pathSeparator).last;
}

extension FileEntityX on FileEntity {
  FileTypeEnum get typeEnum => FileManagerHelper.getType(this);

  String get downloadedPath => "$storageDownload/$name";
}
