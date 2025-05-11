part of 'download_file_cubit.dart';

sealed class DownloadFileState extends Equatable {
  const DownloadFileState();

  @override
  List<Object> get props => [];
}

final class DownloadFileInitial extends DownloadFileState {}

final class DownloadFileLoading extends DownloadFileState {}

final class DownloadFileInProgress extends DownloadFileState {}

final class DownloadFileStarted extends DownloadFileState {}

final class DownloadFileFailure extends DownloadFileState {
  const DownloadFileFailure(this.error);

  final DartSiaException error;

  @override
  List<Object> get props => [error];
}
