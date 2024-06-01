part of 'files_bloc.dart';

sealed class FilesState {
  const FilesState();
}

final class FilesInitial extends FilesState {}

class BucketSelected extends FilesState {
  final int bucketIndexSelected;

  const BucketSelected({
    required this.bucketIndexSelected,
  });
}
