import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../domain/entities/file_entity.dart';
import '../../domain/usecases/fetch_files_from_bucket_usecase.dart';
import '../../domain/usecases/fetch_files_from_folder_usecase.dart';

part 'fetch_all_files_event.dart';
part 'fetch_all_files_state.dart';

@Injectable()
class FetchAllFilesBloc extends Bloc<FetchAllFilesEvent, FetchAllFilesState> {
  final FetchFilesFromBucketUsecase fetchFilesFromBucketUsecase;
  final FetchFilesFromFolderUsecase fetchFilesFromFolderUsecase;

  FetchAllFilesBloc({
    required this.fetchFilesFromBucketUsecase,
    required this.fetchFilesFromFolderUsecase,
  }) : super(FetchAllFilesInitial()) {
    on<FetchTheFilesFromBucketEvent>((event, emit) async {
      emit(FetchAllFilesLoading());
      Result<List<FileEntity>, String> _result =
          await fetchFilesFromBucketUsecase.call(
        bucketName: event.bucketName,
        prefix: event.prefix,
      );

      _result.when(
          (success) => emit(FilesFoundWithSuccess(allFiles: success)),
          (error) => emit(error == Lang.noFileText
              ? FilesFoundWithEmpty(message: error)
              : FilesFoundWithFailed(message: error)));
    });

    on<FetchTheFilesFromFolderEvent>((event, emit) async {
      emit(FetchAllFilesLoading());
      Result<List<FileEntity>, String> _result =
          await fetchFilesFromFolderUsecase.call(
        bucketName: event.bucketName,
        prefix: event.prefix,
      );

      _result.when(
          (success) => emit(FilesFoundWithSuccess(allFiles: success)),
          (error) => emit(error == Lang.noFileText
              ? FilesFoundWithEmpty(message: error)
              : FilesFoundWithFailed(message: error)));
    });
  }
}
