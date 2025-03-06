part of 'fetch_the_hoster_for_config_bloc.dart';

sealed class FetchTheHosterForConfigState extends Equatable {
  const FetchTheHosterForConfigState();

  @override
  List<Object> get props => [];
}

final class FetchTheHosterForConfigInitial
    extends FetchTheHosterForConfigState {}

class TheHostDataFetchedForConfigSuccess extends FetchTheHosterForConfigState {
  final TheHostDataEntity theHostDataEntity;

  const TheHostDataFetchedForConfigSuccess({
    required this.theHostDataEntity,
  });

  @override
  List<Object> get props => [theHostDataEntity];
}

class TheHostDataFetchedForConfigFailed extends FetchTheHosterForConfigState {
  final String message;

  const TheHostDataFetchedForConfigFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class MakLoginForConfigPlease extends FetchTheHosterForConfigState {
  final String message;

  const MakLoginForConfigPlease({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
