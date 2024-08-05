import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/usecases/delete_the_file_usecase.dart';

part 'file_editor_event.dart';
part 'file_editor_state.dart';

@injectable
class FileEditorBloc extends Bloc<FileEditorEvent, FileEditorState> {
  final DeleteTheFileUsecase deleteTheFileUsecase;

  FileEditorBloc({
    required this.deleteTheFileUsecase,
  }) : super(FileEditorInitial()) {
    on<UserDeleteTheFileEvent>((event, emit) async {
      Result<String, String> _result = await deleteTheFileUsecase.call(
          fileNameWithExtension: event.fileNameWithExtension);

      _result.when(
        (success) => emit(FileEditedSuccess(message: success)),
        (error) => emit(FileEditedFailed(message: error)),
      );
    });
  }
}
