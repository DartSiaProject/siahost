part of 'fetch_all_hosts_data_bloc.dart';

sealed class FetchAllHostsDataState {
  const FetchAllHostsDataState();
}

final class FetchAllHostsDataInitial extends FetchAllHostsDataState {}

class HostDataListLoaded extends FetchAllHostsDataState {
  final List<CardOfHostEntity> hostModelList;

  const HostDataListLoaded({
    required this.hostModelList,
  });
}

class HostDataListError extends FetchAllHostsDataState {
  final String message;

  const HostDataListError({required this.message});
}

class HostDataSearchedListEmpty extends FetchAllHostsDataState {
  final String message;

  const HostDataSearchedListEmpty({required this.message});
}
