part of 'host_list_bloc.dart';

final class HostListState extends Equatable {
  const HostListState({
    this.status = StateStatus.initial,
    this.hosts = const [],
    this.error,
    this.searchedHost,
    this.page = 0,
    this.hasMore = false,
  });

  final StateStatus status;
  final List<HostInfoModel> hosts;
  final DartSiaException? error;
  final HostInfoModel? searchedHost;

  // for temporary pagination
  final int page;
  final bool hasMore;

  HostListState copyWith({
    StateStatus? status,
    List<HostInfoModel>? hosts,
    DartSiaException? error,
    HostInfoModel? searchedHost,
    int? page,
    bool? hasMore,
  }) {
    return HostListState(
      status: status ?? this.status,
      hosts: hosts ?? this.hosts,
      error: error,
      searchedHost: searchedHost,

      //
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [
        status,
        hosts,
        error,
        searchedHost,

        //
        page,
        hasMore,
      ];
}
