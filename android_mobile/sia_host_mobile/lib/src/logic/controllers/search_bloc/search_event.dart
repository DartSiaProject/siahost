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

class NextSubPageIndexEvent extends SearchEvent {
  final int index;
  final String hostPubKey;

  const NextSubPageIndexEvent({
    required this.index,
    required this.hostPubKey,
  });
}

class PreviousSubPageIndexEvent extends SearchEvent {
  final int index;

  const PreviousSubPageIndexEvent({
    required this.index,
  });
}

class GetOneHostEvent extends SearchEvent {
  final String pubKey;

  const GetOneHostEvent({required this.pubKey});
}
