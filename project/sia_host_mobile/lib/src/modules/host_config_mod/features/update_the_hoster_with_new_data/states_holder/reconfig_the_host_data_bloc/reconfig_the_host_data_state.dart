part of 'reconfig_the_host_data_bloc.dart';

sealed class ReconfigTheHostDataState extends Equatable {
  const ReconfigTheHostDataState();

  @override
  List<Object> get props => [];
}

final class ReconfigTheHostDataInitial extends ReconfigTheHostDataState {}

class TheHostConfigLoading extends ReconfigTheHostDataState {}

class TheHostConfigSuccess extends ReconfigTheHostDataState {
  final String message;

  const TheHostConfigSuccess({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

class TheHostConfigFailed extends ReconfigTheHostDataState {
  final String message;

  const TheHostConfigFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
