import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/models.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/services/file_storage_service.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

part 'file_view_state.dart';

class FileViewCubit extends Cubit<FileViewState> {
  FileViewCubit(this._fileStorageService) : super(FileViewInitial());

  final FileStorageService _fileStorageService;

  /// Open a file
  ///
  Future<void> openFileObject(BucketObjectModel fileObject) async {
    emit(FileViewLoading());

    try {
      final file = await _fileStorageService.fileExists(
        fileName: fileObject.key,
        fileType: fileObject.type,
      );
      if (file == null) {
        emit(
          const FileViewFailure(
            DartSiaException(
              'File not found',
              error: ResponseStatus.notFound,
            ),
          ),
        );
        return;
      }

      emit(FileViewSuccess(file.path));
    } catch (e) {
      emit(
        FileViewFailure(
          DartSiaException.handleError(e),
        ),
      );
    }
  }
}
