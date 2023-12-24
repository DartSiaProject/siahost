part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class PasswordHidded extends AccountState {
  final bool passWordIsHided;

  const PasswordHidded({required this.passWordIsHided});

  @override
  List<Object> get props => [passWordIsHided];
}

class LoginLoading extends AccountState {}

class LoginSuccess extends AccountState {
  final String message;

  const LoginSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginFailed extends AccountState {
  final String message;

  const LoginFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class NewLoginLoading extends AccountState {}

class NewLoginSuccess extends AccountState {
  final String message;

  const NewLoginSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class NewLoginFailed extends AccountState {
  final String message;

  const NewLoginFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class CredentialAreExist extends AccountState {}

class CredentialAreNotExist extends AccountState {}
