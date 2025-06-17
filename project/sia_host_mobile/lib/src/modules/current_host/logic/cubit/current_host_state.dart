part of 'current_host_cubit.dart';

sealed class CurrentHostState extends Equatable {
  const CurrentHostState();

  @override
  List<Object> get props => [];
}

final class CurrentHostInitial extends CurrentHostState {}

final class CurrentHostLoading extends CurrentHostState {}

final class CurrentHostSuccess extends CurrentHostState {
  const CurrentHostSuccess(this.hostInfo);
  final CurrentHostInfoModel hostInfo;

  @override
  List<Object> get props => [hostInfo];
}

final class CurrentHostFailure extends CurrentHostState {
  const CurrentHostFailure(this.error);
  final DartSiaException error;

  @override
  List<Object> get props => [error];
}
