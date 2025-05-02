part of 'hosts_list_bloc.dart';

sealed class HostsListEvent extends Equatable {
  const HostsListEvent();

  @override
  List<Object> get props => [];
}

final class HostsListFetchedEvent extends HostsListEvent {}

final class HostsListSearchedEvent extends HostsListEvent {
  const HostsListSearchedEvent({required this.hostKey});
  final String hostKey;

  @override
  List<Object> get props => [hostKey];
}
