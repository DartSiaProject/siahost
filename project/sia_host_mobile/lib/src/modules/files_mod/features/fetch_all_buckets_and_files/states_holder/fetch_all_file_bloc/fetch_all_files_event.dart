part of 'fetch_all_files_bloc.dart';

sealed class FetchAllFilesEvent extends Equatable {
  const FetchAllFilesEvent();

  @override
  List<Object> get props => [];
}

class FetchTheFilesFromBucketEvent extends FetchAllFilesEvent {
  final String bucketName;
  final String prefix;

  const FetchTheFilesFromBucketEvent({
    required this.bucketName,
    required this.prefix,
  });
}

class FetchTheFilesFromFolderEvent extends FetchAllFilesEvent {
  final String bucketName;
  final String prefix;

  const FetchTheFilesFromFolderEvent({
    required this.bucketName,
    required this.prefix,
  });
}
