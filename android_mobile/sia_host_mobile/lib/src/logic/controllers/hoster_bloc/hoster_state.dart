part of 'hoster_bloc.dart';

abstract class HosterState extends Equatable {
  const HosterState();

  @override
  List<Object> get props => [];
}

class HosterInitial extends HosterState {}

class MyHostLoading extends HosterState {}

class MyHostDataGetSuccess extends HosterState {
  final HostSetting hostSetting;

  const MyHostDataGetSuccess({
    required this.hostSetting,
  });
}

class MyHostDataGetFailed extends HosterState {
  final String message;

  const MyHostDataGetFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class MyHostConfigLoading extends HosterState {}

class MyHostConfigSuccess extends HosterState {
  final String message;

  const MyHostConfigSuccess({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}

class MyHostConfigFailed extends HosterState {
  final String message;

  const MyHostConfigFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
