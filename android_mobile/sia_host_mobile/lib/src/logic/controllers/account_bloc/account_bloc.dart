import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<HideThePassWordEvent>((event, emit) {
      emit(PasswordHidded(passWordIsHided: event.hideThePassWord));
    });
  }
}
