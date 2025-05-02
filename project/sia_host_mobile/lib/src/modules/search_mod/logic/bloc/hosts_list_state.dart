part of 'hosts_list_bloc.dart';

enum HostsListStatus {
  initial,
  loading,
  success,
  failure,
  paginating,
  searching,
  paginatingFailure,
}

final class HostsListState extends Equatable {
  const HostsListState();

  final HostsListStatus status;
  final List<HostInfoModel> hosts;
  final String error;
  final bool hasMore;
  final int page;

  @override
  List<Object> get props => [
        status,
        hosts,
        error,
        hasMore,
        page,
      ];
}
