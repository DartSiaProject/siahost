import 'package:equatable/equatable.dart';

class FileDetailsEntity extends Equatable {
  final String fileName;
  final int fileSize;
  final String modTime;

  const FileDetailsEntity({
    this.fileName = '',
    this.fileSize = 0,
    this.modTime = '',
  });

  FileDetailsEntity copyWith({
    String? fileName,
    int? fileSize,
    String? modTime,
  }) {
    return FileDetailsEntity(
      fileName: fileName ?? this.fileName,
      fileSize: fileSize ?? this.fileSize,
      modTime: modTime ?? this.modTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fileName': fileName,
      'fileSize': fileSize,
      'modTime': modTime,
    };
  }

  @override
  List<Object> get props => [
        fileName,
        fileSize,
        modTime,
      ];
}
