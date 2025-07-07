part of 'backup_list_cubit.dart';

final class BackupListState extends Equatable {
  const BackupListState({
    this.status = StateStatus.initial,
    this.backups = const [],
    this.error,
  });

  final StateStatus status;
  final List<File> backups;
  final DartSiaException? error;

  BackupListState copyWith({
    StateStatus? status,
    List<File>? backups,
    DartSiaException? error,
  }) {
    return BackupListState(
      status: status ?? this.status,
      backups: backups ?? this.backups,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        backups,
        error,
      ];
}
