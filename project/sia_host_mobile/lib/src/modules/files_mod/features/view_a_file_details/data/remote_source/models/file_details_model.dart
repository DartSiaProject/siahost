import 'package:sia_host_mobile/src/modules/files_mod/features/view_a_file_details/domain/entities/file_details_entity.dart';

class FileDetailsModel extends FileDetailsEntity {
  const FileDetailsModel({
    super.fileName,
    super.fileSize,
    super.modTime,
  });

  static FileDetailsModel fromMap(Map<String, dynamic> data) =>
      FileDetailsModel(
        fileName: data["name"],
        fileSize: data["size"],
        modTime: data["modTime"],
      );
}
