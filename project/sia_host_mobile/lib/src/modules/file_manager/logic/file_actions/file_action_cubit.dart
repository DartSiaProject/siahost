import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_object_model.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/repositories/file_action_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';

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
          emit(FileActionUploadProgress((sent / total) * 100));
        },
      );

      emit(FileActionSuccess());
    } catch (e) {
      emit(FileActionFailure(DartSiaException.handleError(e)));
    }
  }

  /// Download a file
  ///
  Future<void> download(
    BucketObjectModel fileObject,
  ) async {
    emit(FileActionLoading());

    try {
      await _repository.downloadFile(
        fileObject: fileObject,
        onReceiveProgress: (sent, total) {
          emit(FileActionUploadProgress((sent / total) * 100));
        },
      );

      emit(FileActionSuccess());
    } catch (e) {
      emit(FileActionFailure(DartSiaException.handleError(e)));
    }
  }

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

      emit(FileActionSuccess());
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
      await _repository.renameFile(
        file: file,
        newFileName: newFileName,
      );

      emit(FileActionSuccess());
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

      emit(FileActionSuccess());
    } catch (e) {
      emit(FileActionFailure(DartSiaException.handleError(e)));
    }
  }
}
