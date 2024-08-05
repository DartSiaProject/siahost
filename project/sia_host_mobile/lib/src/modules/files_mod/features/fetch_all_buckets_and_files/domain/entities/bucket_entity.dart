import 'package:equatable/equatable.dart';

class BucketEntity extends Equatable {
  final String nameBucket;
  final int totalFiles;

  const BucketEntity({
    this.nameBucket = '',
    this.totalFiles = 0,
  });

  BucketEntity copyWith({
    String? nameBucket,
    int? totalFiles,
  }) {
    return BucketEntity(
      nameBucket: nameBucket ?? this.nameBucket,
      totalFiles: totalFiles ?? this.totalFiles,
    );
  }

  @override
  List<Object> get props => [
        nameBucket,
        totalFiles,
      ];
}
