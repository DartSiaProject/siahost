part of 'host_list_bloc.dart';

final class HostListState extends Equatable {
  const HostListState({
    this.status = StateStatus.initial,
    this.hosts = const [],
    this.error,
    this.searchedHost,
  });

  final StateStatus status;
  final List<HostInfoModel> hosts;
  final DartSiaException? error;
  final HostInfoModel? searchedHost;

  HostListState copyWith({
    StateStatus? status,
    List<HostInfoModel>? hosts,
    DartSiaException? error,
    HostInfoModel? searchedHost,
  }) {
    return HostListState(
      status: status ?? this.status,
      hosts: hosts ?? this.hosts,
      error: error,
      searchedHost: searchedHost,
    );
  }

  @override
  List<Object?> get props => [
        status,
        hosts,
        error,
        searchedHost,
      ];
}
