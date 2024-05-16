part of 'fetch_all_hosts_data_bloc.dart';

sealed class FetchAllHostsDataEvent extends Equatable {
  const FetchAllHostsDataEvent();

  @override
  List<Object> get props => [];
}

class FetchAllHostsDataListEvent extends FetchAllHostsDataEvent {}

class SearchHostSearchedByPubKeyEvent extends FetchAllHostsDataEvent {
  final String pubKey;

  const SearchHostSearchedByPubKeyEvent({
    required this.pubKey,
  });
}
