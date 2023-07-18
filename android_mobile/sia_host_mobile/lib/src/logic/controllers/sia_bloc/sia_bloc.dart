import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sia_event.dart';
part 'sia_state.dart';

class SiaBloc extends Bloc<SiaEvent, SiaState> {
  SiaBloc() : super(SiaInitial()) {
    on<NextPageIndexEvent>((event, emit) {
      emit(NextFragmentSelected(nextFragment: event.index));
    });

    on<PreviousPageIndexEvent>((event, emit) {
      emit(PreviousFragmentSelected(previousFragment: event.index));
    });
  }
}
