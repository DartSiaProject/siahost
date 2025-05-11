import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/repositories/file_action_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

part 'file_action_state.dart';

class FileActionCubit extends Cubit<FileActionState> {
  FileActionCubit(this._repository) : super(FileActionInitial());

  final FileActionRepository _repository;

  /// Upload a file
  ///
  Future<void> upload(
    File file, {
    required String bucketName,
    required String fileName,
  }) async {
    emit(FileActionLoading());

    try {
      await _repository.uploadFile(
        bucketName: bucketName,
        fileName: fileName,
        file: file,
        onSendProgress: (sent, total) {
          Future<dynamic>.delayed(
            const Duration(seconds: 1),
            () =>
                emit(FileActionUploadProgress(((sent / total) * 100).floor())),
          );
        },
      );

      emit(FileActionUploaded(fileName));
    } catch (e) {
      emit(FileActionFailure(DartSiaException.handleError(e)));
    }
  }

  /// Download a file
  ///
  // Future<void> download(
  //   BucketObjectModel fileObject,
  // ) async {
  //   // emit(FileActionLoading());

  //   // try {
  //   //   await _repository.downloadFile(
  //   //     fileObject: fileObject,
  //   //     onReceiveProgress: (received, total) {
  //   //       Future<dynamic>.delayed(
  //   //         const Duration(seconds: 1),
  //   //         () => emit(FileActionUploadProgress((received / total) * 100)),
  //   //       );
  //   //     },
  //   //   );

  //   //   emit(FileActionDownloaded());
  //   // } catch (e) {
  //   //   emit(FileActionFailure(DartSiaException.handleError(e)));
  //   // }

  //   emit(FileActionLoading());

  //   final enqueued = await downloadService.enqueueDownload(
  //     url: event.url,
  //     fileId: event.fileId,
  //     filename: event.filename,
  //   );

  //   emit(enqueued
  //     ? DownloadStarted(event.fileId)
  //     : DownloadError(event.fileId, 'Download already in progress'));
  // }

  /// COpy a file
  ///
  Future<void> copy(
    BucketObjectModel sourcefile, {
    required String destfileName,
    String? destBucketName,
  }) async {
    emit(FileActionLoading());

    try {
      await _repository.copyFile(
        sourcefile: sourcefile,
        destfileName: destfileName,
        destBucketName: destBucketName,
      );

      emit(FileActionCopied());
    } catch (e) {
      emit(FileActionFailure(DartSiaException.handleError(e)));
    }
  }

  /// Rename a file
  ///
  Future<void> rename(
    BucketObjectModel file, {
    required String newFileName,
  }) async {
    emit(FileActionLoading());

    try {
      final newName = await _repository.renameFile(
        file: file,
        newFileName: newFileName,
      );

      emit(FileActionRenamed(newName));
    } catch (e) {
      emit(FileActionFailure(DartSiaException.handleError(e)));
    }
  }

  /// Delete a file
  ///
  Future<void> remove(
    BucketObjectModel file,
  ) async {
    emit(FileActionLoading());

    try {
      await _repository.deleteFile(
        file: file,
      );

      emit(FileActionDeleted());
    } catch (e) {
      emit(FileActionFailure(DartSiaException.handleError(e)));
    }
  }

  /// check if the user can open the file
  ///
  Future<void> canOpenFile(BucketObjectModel fileObject) async {
    emit(FileActionLoading());

    try {
      final filePath = await _repository.canOpenFile(fileObject);

      emit(
        FileActionOpening(
          filePath: filePath,
          isSupported: fileObject.type != SupportedFileType.archive &&
                  fileObject.type != SupportedFileType.other ||
              fileObject.type == SupportedFileType.document,
        ),
      );
    } catch (e) {
      emit(FileActionFailure(DartSiaException.handleError(e)));
    }
  }
}
