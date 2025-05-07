part of 'host_config_cubit.dart';

sealed class HostConfigState extends Equatable {
  const HostConfigState();

  @override
  List<Object> get props => [];
}

final class HostConfigInitial extends HostConfigState {}

final class HostConfigLoading extends HostConfigState {}

final class HostConfigSuccess extends HostConfigState {}

final class HostConfigFailure extends HostConfigState {
  const HostConfigFailure(this.error);

  final DartSiaException error;

  @override
  List<Object> get props => [error];
}
