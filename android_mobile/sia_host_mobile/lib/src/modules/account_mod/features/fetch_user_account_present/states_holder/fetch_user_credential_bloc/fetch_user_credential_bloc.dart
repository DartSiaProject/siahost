import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/usecases/fetch_user_credential_usecase.dart';

part 'fetch_user_credential_event.dart';
part 'fetch_user_credential_state.dart';

@injectable
class FetchUserCredentialBloc
    extends Bloc<FetchUserCredentialEvent, FetchUserCredentialState> {
  final FetchUserCredentialUsecase fetchUserCredentialUsecase;

  StreamSubscription<Result<void, void>>? _credetialPresentSubscription;

  FetchUserCredentialBloc({
    required this.fetchUserCredentialUsecase,
  }) : super(FetchUserCredentialInitial()) {
    on<FetchUserCredentialFromCacheEvent>((event, emit) {
      _credetialPresentSubscription?.cancel();

      var _streamResult = fetchUserCredentialUsecase.call();
      _credetialPresentSubscription = _streamResult.listen((_resultEvent) {
        add(EmitUserCredentialPresentEvent(result: _resultEvent));
      });
    });

    on<EmitUserCredentialPresentEvent>((event, emit) {
      event.result.when(
        (success) => emit(UserCredentialFetchedIsPresent()),
        (error) => emit(UserCredentialFetchedIsAbsent()),
      );
    });
  }

  @override
  Future<void> close() {
    _credetialPresentSubscription?.cancel();
    return super.close();
  }
}
