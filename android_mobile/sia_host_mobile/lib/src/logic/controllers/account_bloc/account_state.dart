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
