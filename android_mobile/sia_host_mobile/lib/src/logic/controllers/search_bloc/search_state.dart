part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class HostDataListLoading extends SearchState {}

class HostDataListLoaded extends SearchState {
  final List<Host> hostModelList;

  const HostDataListLoaded({
    required this.hostModelList,
  });
  @override
  List<Object> get props => [hostModelList];
}

class HostDataListError extends SearchState {
  final String message;

  const HostDataListError({required this.message});

  @override
  List<Object> get props => [message];
}

class HostDataSearchedListEmpty extends SearchState {
  final String message;

  const HostDataSearchedListEmpty({required this.message});

  @override
  List<Object> get props => [message];
}

class NextSubFragmentSelected extends SearchState {
  final int nextSubFragmentIndex;
  final String hostPubKey;

  const NextSubFragmentSelected({
    required this.nextSubFragmentIndex,
    required this.hostPubKey,
  });
  @override
  List<Object> get props => [nextSubFragmentIndex];
}

class PreviousSubFragmentSelected extends SearchState {
  final int previousSubFragmentIndex;

  const PreviousSubFragmentSelected({
    required this.previousSubFragmentIndex,
  });
  @override
  List<Object> get props => [previousSubFragmentIndex];
}

class HostInfoGetLoading extends SearchState {}

class HostInfoGot extends SearchState {
  final Host hostModel;

  const HostInfoGot({required this.hostModel});

  @override
  List<Object> get props => [hostModel];
}
