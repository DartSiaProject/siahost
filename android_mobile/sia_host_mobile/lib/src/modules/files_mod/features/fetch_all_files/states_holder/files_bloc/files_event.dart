part of 'files_bloc.dart';

sealed class FilesEvent extends Equatable {
  const FilesEvent();

  @override
  List<Object> get props => [];
}

class SelectTheBucketIndexEvent extends FilesEvent {
  final int bucketIndex;

  const SelectTheBucketIndexEvent({
    required this.bucketIndex,
  });
}
