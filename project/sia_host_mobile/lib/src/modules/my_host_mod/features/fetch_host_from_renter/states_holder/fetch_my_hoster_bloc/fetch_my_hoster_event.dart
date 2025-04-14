part of 'fetch_my_hoster_bloc.dart';

sealed class FetchMyHosterEvent extends Equatable {
  const FetchMyHosterEvent();

  @override
  List<Object> get props => [];
}

class FetchMyHostFromRenterdEvent extends FetchMyHosterEvent {}
