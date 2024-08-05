part of 'file_editor_bloc.dart';

sealed class FileEditorState extends Equatable {
  const FileEditorState();

  @override
  List<Object> get props => [];
}

final class FileEditorInitial extends FileEditorState {}

class FileDeleteLoading extends FileEditorState {}

class FileEditedSuccess extends FileEditorState {
  final String message;

  const FileEditedSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class FileEditedFailed extends FileEditorState {
  final String message;

  const FileEditedFailed({required this.message});

  @override
  List<Object> get props => [message];
}
