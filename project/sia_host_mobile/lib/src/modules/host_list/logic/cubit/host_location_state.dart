part of 'host_location_cubit.dart';

sealed class HostLocationState extends Equatable {
  const HostLocationState();

  @override
  List<Object> get props => [];
}

final class HostLocationInitial extends HostLocationState {}

final class HostLocationLoading extends HostLocationState {}

final class HostLocationSuccess extends HostLocationState {
  const HostLocationSuccess(this.location);
  final String location;
  @override
  List<Object> get props => [location];
}

final class HostLocationFailure extends HostLocationState {
  const HostLocationFailure(this.error);
  final DartSiaException error;
  @override
  List<Object> get props => [error];
}
