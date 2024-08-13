import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/file_editor/domain/usecases/user_upload_the_file_usecase.dart';

import '../../domain/entities/copy_file_info_entity.dart';
import '../../domain/entities/rename_file_info_entity.dart';
import '../../domain/usecases/copy_and_paste_usecase.dart';
import '../../domain/usecases/delete_the_file_usecase.dart';
import '../../domain/usecases/user_rename_the_file_usecase.dart';

part 'file_editor_event.dart';
part 'file_editor_state.dart';

@injectable
class FileEditorBloc extends Bloc<FileEditorEvent, FileEditorState> {
  final UserUploadTheFileUsecase userUploadTheFileUsecase;
  final DeleteTheFileUsecase deleteTheFileUsecase;
  final CopyAndPasteUsecase copyAndPasteUsecase;
  final UserRenameTheFileUsecase userRenameTheFileUsecase;

  FileEditorBloc({
    required this.userUploadTheFileUsecase,
    required this.deleteTheFileUsecase,
    required this.copyAndPasteUsecase,
    required this.userRenameTheFileUsecase,
  }) : super(FileEditorInitial()) {
    on<UserUploadTheFileEvent>((event, emit) async {
      emit(FileEditedLoading());
      Result<String, String> _result =
          await userUploadTheFileUsecase.call(bucketName: event.bucketName);
      _result.when(
        (success) => emit(FileEditedSuccess(message: success)),
        (error) => emit(FileEditedFailed(message: error)),
      );
    });
    on<UserDeleteTheFileEvent>((event, emit) async {
      emit(FileEditedLoading());
      Result<String, String> _result = await deleteTheFileUsecase.call(
        fileName: event.fileName,
        bucketName: event.bucketName,
      );

      _result.when(
        (success) => emit(FileEditedSuccess(message: success)),
        (error) => emit(FileEditedFailed(message: error)),
      );
    });

    on<UserCopyAndPasteTheFileEvent>((event, emit) async {
      emit(FileEditedLoading());
      Result<String, String> _result = await copyAndPasteUsecase.call(
        copyFileInfoEntity: event.copyFileInfoEntity,
      );

      _result.when(
        (success) => emit(FileEditedSuccess(message: success)),
        (error) => emit(FileEditedFailed(message: error)),
      );
    });

    on<UserRenameAFileEvent>((event, emit) async {
      emit(FileEditedLoading());
      Result<String, String> _result = await userRenameTheFileUsecase.call(
          renameFileInfoEntity: event.renameFileInfoEntity);

      _result.when(
        (success) => emit(FileEditedSuccess(message: success)),
        (error) => emit(FileEditedFailed(message: error)),
      );
    });
  }
}
