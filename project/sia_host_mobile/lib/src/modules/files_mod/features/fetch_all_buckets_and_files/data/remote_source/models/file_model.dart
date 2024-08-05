import '../../../domain/entities/file_entity.dart';

class FileModel extends FileEntity {
  const FileModel({
    super.eTag,
    super.health,
    super.modTime,
    super.name,
    super.fileType,
    super.totalFiles,
    super.size,
    super.mimeType,
  });

  static FileModel fromMap(Map<String, dynamic> data) => FileModel(
        eTag: data["eTag"],
        health: data["health"],
        modTime: data["modTime"],
        name: data["name"],
        fileType: "file",
        totalFiles: 0,
        size: data["size"],
        mimeType: data["mimeType"] ?? "",
      );
}
