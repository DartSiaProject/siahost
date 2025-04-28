part of 'network_overview_bloc.dart';

sealed class NetworkOverviewEvent extends Equatable {
  const NetworkOverviewEvent();

  @override
  List<Object> get props => [];
}

final class NetworkOverviewFetchedEvent extends NetworkOverviewEvent {}
