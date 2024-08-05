part of 'fetch_all_files_bloc.dart';

sealed class FetchAllFilesEvent extends Equatable {
  const FetchAllFilesEvent();

  @override
  List<Object> get props => [];
}

class FetchTheFilesFromBucketEvent extends FetchAllFilesEvent {
  final String bucketName;

  const FetchTheFilesFromBucketEvent({
    required this.bucketName,
  });
}
