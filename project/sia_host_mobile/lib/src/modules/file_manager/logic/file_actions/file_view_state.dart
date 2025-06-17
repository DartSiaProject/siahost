part of 'file_view_cubit.dart';

sealed class FileViewState extends Equatable {
  const FileViewState();

  @override
  List<Object> get props => [];
}

final class FileViewInitial extends FileViewState {}

final class FileViewLoading extends FileViewState {}

final class FileViewSuccess extends FileViewState {
  const FileViewSuccess(this.filePath);

  final String filePath;

  @override
  List<Object> get props => [filePath];
}

final class FileViewFailure extends FileViewState {
  const FileViewFailure(this.error);

  final DartSiaException error;

  @override
  List<Object> get props => [error];
}
