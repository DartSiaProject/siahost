part of 'file_action_cubit.dart';

sealed class FileActionState extends Equatable {
  const FileActionState();

  @override
  List<Object?> get props => [];
}

final class FileActionInitial extends FileActionState {}

final class FileActionLoading extends FileActionState {}

final class FileActionUploaded extends FileActionState {
  const FileActionUploaded(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

final class FileActionDownloaded extends FileActionState {}

final class FileActionCopied extends FileActionState {}

final class FileActionRenamed extends FileActionState {
  const FileActionRenamed(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

final class FileActionDeleted extends FileActionState {}

final class FileActionFailure extends FileActionState {
  const FileActionFailure(this.error);

  final DartSiaException error;

  @override
  List<Object> get props => [error];
}

final class FileActionUploadProgress extends FileActionState {
  const FileActionUploadProgress(this.percentage);

  final int percentage;

  @override
  List<Object> get props => [percentage];
}

final class FileActionDownloadProgress extends FileActionState {
  const FileActionDownloadProgress(this.percentage);

  final double percentage;

  @override
  List<Object> get props => [percentage];
}

final class FileActionOpening extends FileActionState {
  const FileActionOpening({
    required this.filePath,
    required this.isSupported,
  });

  final String? filePath;
  final bool isSupported;

  @override
  List<Object?> get props => [filePath, isSupported];
}
