import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/backup/data/repositories/backup_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

part 'backup_state.dart';

class BackupCubit extends Cubit<BackupState> {
  BackupCubit(this._repository) : super(BackupInitial());

  final BackupRepository _repository;

  Future<void> backup() async {
    emit(BackupLoading());
    try {
      final file = await _repository.backup();
      emit(BackupSaved(file));
    } catch (e) {
      emit(BackupFailure(DartSiaException.handleError(e)));
    }
  }

  Future<void> restore(File file) async {
    emit(BackupLoading());
    try {
      await _repository.restore(file);
      emit(BackupRestored());
    } catch (e) {
      emit(BackupFailure(DartSiaException.handleError(e)));
    }
  }

  Future<void> remove(File file) async {
    emit(BackupLoading());
    try {
      final deleted = await _repository.deleteLocalBackup(file);
      if (deleted) {
        emit(BackupDeleted());
      } else {
        emit(
          const BackupFailure(
            DartSiaException(null, error: ResponseStatus.cantBeDelete),
          ),
        );
      }
    } catch (e) {
      emit(BackupFailure(DartSiaException.handleError(e)));
    }
  }
}
