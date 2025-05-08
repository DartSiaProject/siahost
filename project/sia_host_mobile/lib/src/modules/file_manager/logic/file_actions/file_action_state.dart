part of 'file_action_cubit.dart';

sealed class FileActionState extends Equatable {
  const FileActionState();

  @override
  List<Object?> get props => [];
}

final class FileActionInitial extends FileActionState {}

final class FileActionLoading extends FileActionState {}

final class FileActionSuccess extends FileActionState {}

final class FileActionFailure extends FileActionState {
  const FileActionFailure(this.error);

  final DartSiaException error;

  @override
  List<Object> get props => [error];
}

final class FileActionUploadProgress extends FileActionState {
  const FileActionUploadProgress(this.percentage);

  final double percentage;

  @override
  List<Object> get props => [percentage];
}

final class FileActionDownloadProgress extends FileActionState {
  const FileActionDownloadProgress(this.percentage);

  final double percentage;

  @override
  List<Object> get props => [percentage];
}
