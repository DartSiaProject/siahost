import 'package:equatable/equatable.dart';

class CopyFileInfoEntity extends Equatable {
  final String sourceBucketName;
  final String sourcefileName;
  final String destBucketName;
  final String destfileName;

  const CopyFileInfoEntity({
    this.sourceBucketName = '',
    this.sourcefileName = '',
    this.destBucketName = '',
    this.destfileName = '',
  });

  CopyFileInfoEntity copyWith({
    String? sourceBucketName,
    String? sourcefileName,
    String? destBucketName,
    String? destfileName,
  }) {
    return CopyFileInfoEntity(
      sourceBucketName: sourceBucketName ?? this.sourceBucketName,
      sourcefileName: sourcefileName ?? this.sourcefileName,
      destBucketName: destBucketName ?? this.destBucketName,
      destfileName: destfileName ?? this.destfileName,
    );
  }

  @override
  List<Object> get props => [
        sourceBucketName,
        sourcefileName,
        destBucketName,
        destfileName,
      ];
}
