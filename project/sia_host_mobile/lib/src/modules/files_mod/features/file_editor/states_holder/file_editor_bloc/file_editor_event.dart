part of 'file_editor_bloc.dart';

sealed class FileEditorEvent extends Equatable {
  const FileEditorEvent();

  @override
  List<Object> get props => [];
}

class UserDeleteTheFileEvent extends FileEditorEvent {
  final String fileNameWithExtension;

  const UserDeleteTheFileEvent({
    required this.fileNameWithExtension,
  });
}
