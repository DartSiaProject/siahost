import 'package:equatable/equatable.dart';

class RenameFileInfoEntity extends Equatable {
  final String bucketName;
  final String oldFileName;
  final String newFileName;

  const RenameFileInfoEntity({
    this.bucketName = '',
    this.oldFileName = '',
    this.newFileName = '',
  });

  RenameFileInfoEntity copyWith({
    String? bucketName,
    String? oldFileName,
    String? newFileName,
  }) {
    return RenameFileInfoEntity(
      bucketName: bucketName ?? this.bucketName,
      oldFileName: oldFileName ?? this.oldFileName,
      newFileName: newFileName ?? this.newFileName,
    );
  }

  @override
  List<Object> get props => [bucketName, oldFileName, newFileName];
}
