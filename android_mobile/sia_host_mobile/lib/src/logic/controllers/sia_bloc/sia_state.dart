part of 'sia_bloc.dart';

abstract class SiaState extends Equatable {
  const SiaState();

  @override
  List<Object> get props => [];
}

class SiaInitial extends SiaState {}

class NextFragmentSelected extends SiaState {
  final int nextFragment;

  const NextFragmentSelected({
    required this.nextFragment,
  });
  @override
  List<Object> get props => [nextFragment];
}

class PreviousFragmentSelected extends SiaState {
  final int previousFragment;

  const PreviousFragmentSelected({
    required this.previousFragment,
  });
  @override
  List<Object> get props => [previousFragment];
}
