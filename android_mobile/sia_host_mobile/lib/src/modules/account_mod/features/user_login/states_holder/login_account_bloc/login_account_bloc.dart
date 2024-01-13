import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/entities/user_login_entity.dart';
import '../../domain/usecases/user_make_the_login_usecase.dart';

part 'login_account_event.dart';
part 'login_account_state.dart';

@injectable
class LoginAccountBloc extends Bloc<LoginAccountEvent, LoginAccountState> {
  final UserMakeTheLoginUsecase userMakeTheLoginUsecase;

  LoginAccountBloc({required this.userMakeTheLoginUsecase})
      : super(LoginAccountInitial()) {
    on<HideThePassWordEvent>((event, emit) {
      emit(PasswordHidded(passWordIsHided: event.hideThePassWord));
    });

    on<MakeLoginEvent>((event, emit) async {
      emit(LoginLoading());

      Result<String, String> _result = await userMakeTheLoginUsecase.call(
          userLoginEntity: event.userLoginEntity);
      _result.when((success) => emit(LoginSuccess(message: success)),
          (error) => emit(LoginFailed(message: error)));
    });

    on<MakeNewLoginEvent>((event, emit) async {
      emit(NewLoginLoading());

      Result<String, String> _result = await userMakeTheLoginUsecase.call(
          userLoginEntity: event.userLoginEntity);
      _result.when((success) => emit(NewLoginSuccess(message: success)),
          (error) => emit(NewLoginFailed(message: error)));
    });
  }
}
