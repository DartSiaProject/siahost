part of 'network_bloc.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];
}

class NetworkInitial extends NetworkState {}

class HostLoading extends NetworkState {}

class NetworkDataGetSuccess extends NetworkState {
  final Map<String, dynamic> networkData;

  const NetworkDataGetSuccess({
    required this.networkData,
  });
}

class NetworkDataGetFailed extends NetworkState {
  final String message;

  const NetworkDataGetFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
