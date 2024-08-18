part of 'network_data_fetching_bloc.dart';

sealed class NetworkDataFetchingState {
  const NetworkDataFetchingState();
}

final class NetworkDataFetchingInitial extends NetworkDataFetchingState {}

class NetworkDataFetchedLoading extends NetworkDataFetchingState {}

class NetworkDataFetchedSuccess extends NetworkDataFetchingState {
  final NetworkDataEntity networkDataEntity;

  NetworkDataFetchedSuccess({
    required this.networkDataEntity,
  });
}

class NetworkDataFetchedFailed extends NetworkDataFetchingState {
  final String message;

  const NetworkDataFetchedFailed({
    required this.message,
  });
}
