import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/services/background_download_service.dart';
import 'package:sia_host_mobile/src/shared/services/file_storage_service.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

part 'download_file_state.dart';

class DownloadFileCubit extends Cubit<DownloadFileState> {
  DownloadFileCubit(this._fileStorageService, this._storageService)
      : super(DownloadFileInitial());
  final FileStorageService _fileStorageService;
  final StorageService _storageService;

  /// Enqueue a download task.
  ///
  Future<void> downloadFile(BucketObjectModel fileObject) async {
    emit(DownloadFileLoading());

    try {
      // 1. Request permission
      final hasPermission =
          await _fileStorageService.requestStoragePermission();
      if (!hasPermission) {
        throw const DartSiaException(
          'Please accept storage permission first.',
          error: ResponseStatus.noStoragePermission,
        );
      }

      // 2. Check storage space
      if (!await _fileStorageService.hasEnoughSpace(fileObject.size)) {
        throw const DartSiaException(
          'Not enough space to download the file.',
          error: ResponseStatus.notEnoughSpace,
        );
      }

      final result = await BackgroundDownloadService.enqueueDownload(
        fileObject: fileObject,
        encodedUserInfo: (await _storageService.getUserString())!,
      );

      if (result) {
        emit(DownloadFileStarted());
      } else {
        emit(DownloadFileInProgress());
      }
    } catch (e) {
      emit(DownloadFileFailure(DartSiaException.handleError(e)));
    }
  }
}
