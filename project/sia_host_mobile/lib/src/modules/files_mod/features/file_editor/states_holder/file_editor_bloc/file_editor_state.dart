part of 'file_editor_bloc.dart';

sealed class FileEditorState {
  const FileEditorState();
}

final class FileEditorInitial extends FileEditorState {}

final class FileEditedLoading extends FileEditorState {}

class FileEditedSuccess extends FileEditorState {
  final String message;

  const FileEditedSuccess({required this.message});
}

class FileDownloadedSuccess extends FileEditorState {
  final String fileName;
  final String message;

  FileDownloadedSuccess({
    required this.fileName,
    required this.message,
  });
}

class FileAlreadyDownloadedSuccess extends FileEditorState {
  final String fileName;

  FileAlreadyDownloadedSuccess({
    required this.fileName,
  });
}

class FileEditedFailed extends FileEditorState {
  final String message;

  const FileEditedFailed({required this.message});
}
