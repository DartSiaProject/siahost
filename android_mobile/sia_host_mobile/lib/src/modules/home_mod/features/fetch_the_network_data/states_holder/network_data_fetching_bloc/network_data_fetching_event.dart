part of 'network_data_fetching_bloc.dart';

sealed class NetworkDataFetchingEvent extends Equatable {
  const NetworkDataFetchingEvent();

  @override
  List<Object> get props => [];
}

class FetchNetworkDataEvent extends NetworkDataFetchingEvent {}
