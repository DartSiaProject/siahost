part of 'fetch_user_credential_bloc.dart';

sealed class FetchUserCredentialEvent extends Equatable {
  const FetchUserCredentialEvent();

  @override
  List<Object> get props => [];
}

class FetchUserCredentialFromCacheEvent extends FetchUserCredentialEvent {}

class EmitUserCredentialPresentEvent extends FetchUserCredentialEvent {
  final Result<void, void> result;

  const EmitUserCredentialPresentEvent({
    required this.result,
  });
}
