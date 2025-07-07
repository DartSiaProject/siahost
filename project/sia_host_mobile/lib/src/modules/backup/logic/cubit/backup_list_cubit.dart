import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/backup/data/repositories/backup_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

part 'backup_list_state.dart';

@LazySingleton()
class BackupListCubit extends Cubit<BackupListState> {
  BackupListCubit(this._repository) : super(const BackupListState());

  final BackupRepository _repository;

  /// Fetch all local backups
  ///
  Future<void> findAll() async {
    emit(state.copyWith(status: StateStatus.loading));
    try {
      final backups = await _repository.fetchLocalBackups();
      emit(state.copyWith(status: StateStatus.success, backups: backups));
    } catch (e) {
      emit(
        state.copyWith(
          status: StateStatus.failure,
          error: DartSiaException.handleError(e),
        ),
      );
    }
  }

  /// Remove a local backup from the list
  ///
  Future<void> remove(File file) async {
    emit(state.copyWith(status: StateStatus.updating));

    final index = state.backups.indexOf(file);

    if (index != -1) {
      final backups = List<File>.from(state.backups)..removeAt(index);

      emit(state.copyWith(backups: backups, status: StateStatus.success));
    }
  }

  /// add a local backup to the list
  ///
  Future<void> add(File file) async {
    emit(state.copyWith(status: StateStatus.updating));

    final backups = List<File>.from(state.backups)..add(file);

    emit(state.copyWith(backups: backups, status: StateStatus.success));
  }
}
