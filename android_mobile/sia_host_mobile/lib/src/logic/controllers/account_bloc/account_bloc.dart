import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/account.dart';
import '../../usecases/account_usecases/check_account_credential_usecase.dart';
import '../../usecases/account_usecases/make_login_usecase.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final MakeLoginUsecase makeLoginUsecase;
  final CheckAccountCredentialUsecase checkAccountCredentialUsecase;

  AccountBloc({
    required this.makeLoginUsecase,
    required this.checkAccountCredentialUsecase,
  }) : super(AccountInitial()) {
    on<HideThePassWordEvent>((event, emit) {
      emit(PasswordHidded(passWordIsHided: event.hideThePassWord));
    });

    on<MakeLoginEvent>((event, emit) async {
      emit(LoginLoading());

      Result<String, String> _result =
          await makeLoginUsecase.call(account: event.account);
      _result.when((success) => emit(LoginSuccess(message: success)),
          (error) => emit(LoginFailed(message: error)));
    });

    on<MakeNewLoginEvent>((event, emit) async {
      emit(NewLoginLoading());

      Result<String, String> _result =
          await makeLoginUsecase.call(account: event.account);
      _result.when((success) => emit(NewLoginSuccess(message: success)),
          (error) => emit(NewLoginFailed(message: error)));
    });

    on<CheckAccountCredentialEvent>((event, emit) async {
      bool _result = await checkAccountCredentialUsecase.call();
      emit(_result ? CredentialAreExist() : CredentialAreNotExist());
    });
  }
}
