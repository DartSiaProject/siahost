part of 'host_list_bloc.dart';

sealed class HostListEvent extends Equatable {
  const HostListEvent();

  @override
  List<Object> get props => [];
}

final class HostListFetchedEvent extends HostListEvent {}

final class HostListSearchedEvent extends HostListEvent {
  const HostListSearchedEvent({required this.publicKey});
  final String publicKey;

  @override
  List<Object> get props => [publicKey];
}
