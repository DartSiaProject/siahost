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
