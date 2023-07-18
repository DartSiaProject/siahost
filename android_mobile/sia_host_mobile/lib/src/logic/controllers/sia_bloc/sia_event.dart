part of 'sia_bloc.dart';

abstract class SiaEvent extends Equatable {
  const SiaEvent();

  @override
  List<Object> get props => [];
}

class NextPageIndexEvent extends SiaEvent {
  final int index;

  const NextPageIndexEvent({
    required this.index,
  });
}

class PreviousPageIndexEvent extends SiaEvent {
  final int index;

  const PreviousPageIndexEvent({
    required this.index,
  });
}
