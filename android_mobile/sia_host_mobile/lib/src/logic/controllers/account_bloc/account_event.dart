part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class HideThePassWordEvent extends AccountEvent {
  final bool hideThePassWord;

  const HideThePassWordEvent({required this.hideThePassWord});
}

class MakeLoginEvent extends AccountEvent {
  final Account account;

  const MakeLoginEvent({
    required this.account,
  });
}

class MakeNewLoginEvent extends AccountEvent {
  final Account account;

  const MakeNewLoginEvent({
    required this.account,
  });
}

class CheckAccountCredentialEvent extends AccountEvent {}
