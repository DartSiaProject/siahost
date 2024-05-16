part of 'login_account_bloc.dart';

sealed class LoginAccountState extends Equatable {
  const LoginAccountState();

  @override
  List<Object> get props => [];
}

final class LoginAccountInitial extends LoginAccountState {}

class PasswordHidded extends LoginAccountState {
  final bool passWordIsHided;

  const PasswordHidded({required this.passWordIsHided});

  @override
  List<Object> get props => [passWordIsHided];
}

class LoginLoading extends LoginAccountState {}

class LoginSuccess extends LoginAccountState {
  final String message;

  const LoginSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginFailed extends LoginAccountState {
  final String message;

  const LoginFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class NewLoginLoading extends LoginAccountState {}

class NewLoginSuccess extends LoginAccountState {
  final String message;

  const NewLoginSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class NewLoginFailed extends LoginAccountState {
  final String message;

  const NewLoginFailed({required this.message});

  @override
  List<Object> get props => [message];
}
