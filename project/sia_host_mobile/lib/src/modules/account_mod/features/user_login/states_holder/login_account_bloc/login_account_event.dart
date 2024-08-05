part of 'login_account_bloc.dart';

sealed class LoginAccountEvent extends Equatable {
  const LoginAccountEvent();

  @override
  List<Object> get props => [];
}

class HideThePassWordEvent extends LoginAccountEvent {
  final bool hideThePassWord;

  const HideThePassWordEvent({required this.hideThePassWord});
}

class MakeLoginEvent extends LoginAccountEvent {
  final UserLoginEntity userLoginEntity;

  const MakeLoginEvent({
    required this.userLoginEntity,
  });
}

class MakeNewLoginEvent extends LoginAccountEvent {
  final UserLoginEntity userLoginEntity;

  const MakeNewLoginEvent({
    required this.userLoginEntity,
  });
}
