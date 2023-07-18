part of 'network_bloc.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];
}

class NetworkInitial extends NetworkState {}

class HostLoading extends NetworkState {}

class AllHostsGetSuccess extends NetworkState {
  final int hostListLength;

  const AllHostsGetSuccess({
    required this.hostListLength,
  });
  @override
  List<Object> get props => [hostListLength];
}

class AllHostsGetFailed extends NetworkState {
  final String message;

  const AllHostsGetFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
