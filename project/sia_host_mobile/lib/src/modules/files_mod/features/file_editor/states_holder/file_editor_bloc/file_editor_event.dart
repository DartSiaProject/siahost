part of 'file_editor_bloc.dart';

sealed class FileEditorEvent extends Equatable {
  const FileEditorEvent();

  @override
  List<Object> get props => [];
}

class UserUploadTheFileEvent extends FileEditorEvent {
  final String bucketName;

  const UserUploadTheFileEvent({
    required this.bucketName,
  });
}

class UserDownloadTheFileEvent extends FileEditorEvent {
  final String fileName;
  final String bucketName;

  const UserDownloadTheFileEvent({
    required this.fileName,
    required this.bucketName,
  });
}

class UserDeleteTheFileEvent extends FileEditorEvent {
  final String fileName;
  final String bucketName;

  const UserDeleteTheFileEvent({
    required this.fileName,
    required this.bucketName,
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
