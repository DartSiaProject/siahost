part of 'fetch_all_files_bloc.dart';

sealed class FetchAllFilesState {
  const FetchAllFilesState();
}

final class FetchAllFilesInitial extends FetchAllFilesState {}

class FetchAllFilesLoading extends FetchAllFilesState {}

class FilesFoundWithSuccess extends FetchAllFilesState {
  final List<FileEntity> allFiles;

  const FilesFoundWithSuccess({
    required this.allFiles,
  });
}

class FilesFoundWithEmpty extends FetchAllFilesState {
  final String message;

  FilesFoundWithEmpty({
    required this.message,
  });
}

class FilesFoundWithFailed extends FetchAllFilesState {
  final String message;

  FilesFoundWithFailed({
    required this.message,
  });
}
