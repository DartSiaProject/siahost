part of 'fetch_one_host_data_and_show_it_bloc.dart';

sealed class FetchOneHostDataAndShowItState extends Equatable {
  const FetchOneHostDataAndShowItState();

  @override
  List<Object> get props => [];
}

final class FetchOneHostDataAndShowItInitial
    extends FetchOneHostDataAndShowItState {}

class HostDataFetchedSuccess extends FetchOneHostDataAndShowItState {
  final HostInfoEntity hostInfoEntity;

  const HostDataFetchedSuccess({
    required this.hostInfoEntity,
  });

  @override
  List<Object> get props => [hostInfoEntity];
}

class HostDataFetchedFailed extends FetchOneHostDataAndShowItState {
  final String message;

  const HostDataFetchedFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
