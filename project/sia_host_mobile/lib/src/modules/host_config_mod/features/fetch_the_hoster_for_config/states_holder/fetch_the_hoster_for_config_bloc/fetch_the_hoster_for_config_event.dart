part of 'fetch_the_hoster_for_config_bloc.dart';

sealed class FetchTheHosterForConfigEvent extends Equatable {
  const FetchTheHosterForConfigEvent();

  @override
  List<Object> get props => [];
}

class FetchTheHostFromRenterdForConfigEvent
    extends FetchTheHosterForConfigEvent {}
