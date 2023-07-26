part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetAllHostsDataListEvent extends SearchEvent {}

class GetHostSearchedByPubKeyEvent extends SearchEvent {
  final String pubKey;

  const GetHostSearchedByPubKeyEvent({
    required this.pubKey,
  });
}
