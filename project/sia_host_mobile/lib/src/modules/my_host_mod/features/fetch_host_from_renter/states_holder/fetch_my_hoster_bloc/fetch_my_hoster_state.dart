part of 'fetch_my_hoster_bloc.dart';

sealed class FetchMyHosterState extends Equatable {
  const FetchMyHosterState();

  @override
  List<Object> get props => [];
}

final class FetchMyHosterInitial extends FetchMyHosterState {}

class MyHostDataGetLoading extends FetchMyHosterState {}

class MyHostDataGetSuccess extends FetchMyHosterState {
  final MyHostDataEntity myHostDataEntity;

  const MyHostDataGetSuccess({
    required this.myHostDataEntity,
  });

  @override
  List<Object> get props => [myHostDataEntity];
}

class MyHostDataGetFailed extends FetchMyHosterState {
  final String message;

  const MyHostDataGetFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class MakLoginPlease extends FetchMyHosterState {
  final String message;

  const MakLoginPlease({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
