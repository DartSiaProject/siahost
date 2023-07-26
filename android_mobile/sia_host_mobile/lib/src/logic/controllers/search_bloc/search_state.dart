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