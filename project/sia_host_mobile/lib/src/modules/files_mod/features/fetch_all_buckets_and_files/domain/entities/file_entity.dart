import 'package:equatable/equatable.dart';

class FileEntity extends Equatable {
  final String eTag;
  final int health;
  final String modTime;
  final String name;
  final String fileType;
  final int totalFiles;
  final int size;
  final String mimeType;

  const FileEntity({
    this.eTag = '',
    this.health = 0,
    this.modTime = '',
    this.name = '',
    this.fileType = '',
    this.totalFiles = 0,
    this.size = 0,
    this.mimeType = '',
  });

  FileEntity copyWith({
    String? eTag,
    int? health,
    String? modTime,
    String? name,
    String? fileType,
    int? totalFiles,
    int? size,
    String? mimeType,
  }) {
    return FileEntity(
      eTag: eTag ?? this.eTag,
      health: health ?? this.health,
      modTime: modTime ?? this.modTime,
      name: name ?? this.name,
      fileType: fileType ?? this.fileType,
      totalFiles: totalFiles ?? this.totalFiles,
      size: size ?? this.size,
      mimeType: mimeType ?? this.mimeType,
    );
  }

  @override
  List<Object> get props {
    return [
      eTag,
      health,
      modTime,
      name,
      fileType,
      totalFiles,
      size,
      mimeType,
    ];
  }
}
