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

class UserCopyAndPasteTheFileEvent extends FileEditorEvent {
  final CopyFileInfoEntity copyFileInfoEntity;

  const UserCopyAndPasteTheFileEvent({
    required this.copyFileInfoEntity,
  });
}

class UserRenameAFileEvent extends FileEditorEvent {
  final RenameFileInfoEntity renameFileInfoEntity;

  const UserRenameAFileEvent({
    required this.renameFileInfoEntity,
  });
}
