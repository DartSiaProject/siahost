part of 'file_editor_bloc.dart';

sealed class FileEditorState {
  const FileEditorState();
}

final class FileEditorInitial extends FileEditorState {}

class FileEditedSuccess extends FileEditorState {
  final String message;

  const FileEditedSuccess({required this.message});
}

class FileEditedFailed extends FileEditorState {
  final String message;

  const FileEditedFailed({required this.message});
}
