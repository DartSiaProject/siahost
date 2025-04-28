part of 'network_overview_bloc.dart';

sealed class NetworkOverviewState extends Equatable {
  const NetworkOverviewState();

  @override
  List<Object> get props => [];
}

final class NetworkOverviewInitial extends NetworkOverviewState {}

final class NetworkOverviewLoading extends NetworkOverviewState {}

final class NetworkOverviewSuccess extends NetworkOverviewState {
  const NetworkOverviewSuccess({required this.networkData});
  final NetworkDataModel networkData;

  @override
  List<Object> get props => [networkData];
}

final class NetworkOverviewFailure extends NetworkOverviewState {
  final String error;

  const NetworkOverviewFailure({required this.error});

  @override
  List<Object> get props => [error];
}
