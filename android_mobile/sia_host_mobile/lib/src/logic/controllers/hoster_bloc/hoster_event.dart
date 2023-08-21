part of 'hoster_bloc.dart';

abstract class HosterEvent extends Equatable {
  const HosterEvent();

  @override
  List<Object> get props => [];
}

class GetMyHostFromRenterdEvent extends HosterEvent {}

class UpdateMyHostFromRenterdEvent extends HosterEvent {
  final HostSetting hostSetting;

  const UpdateMyHostFromRenterdEvent({
    required this.hostSetting,
  });
}
