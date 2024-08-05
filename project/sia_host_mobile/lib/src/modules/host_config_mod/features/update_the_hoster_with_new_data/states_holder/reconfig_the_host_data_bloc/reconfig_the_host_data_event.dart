part of 'reconfig_the_host_data_bloc.dart';

sealed class ReconfigTheHostDataEvent extends Equatable {
  const ReconfigTheHostDataEvent();

  @override
  List<Object> get props => [];
}

class UpdateTheHostFromRenterdEvent extends ReconfigTheHostDataEvent {
  final TheNewDataHostEntity theNewDataHostEntity;

  const UpdateTheHostFromRenterdEvent({
    required this.theNewDataHostEntity,
  });
}
