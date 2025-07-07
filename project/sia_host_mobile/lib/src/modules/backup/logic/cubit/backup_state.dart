part of 'backup_cubit.dart';

sealed class BackupState extends Equatable {
  const BackupState();

  @override
  List<Object> get props => [];
}

final class BackupInitial extends BackupState {}

final class BackupLoading extends BackupState {}

final class BackupSaved extends BackupState {
  const BackupSaved(this.file);

  final File file;

  @override
  List<Object> get props => [file];
}

final class BackupRestored extends BackupState {}

final class BackupDeleted extends BackupState {}

final class BackupFailure extends BackupState {
  const BackupFailure(this.error);

  final DartSiaException error;

  @override
  List<Object> get props => [error];
}
