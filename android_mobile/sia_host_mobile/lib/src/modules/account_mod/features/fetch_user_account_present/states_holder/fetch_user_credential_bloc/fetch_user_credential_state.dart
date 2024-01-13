part of 'fetch_user_credential_bloc.dart';

sealed class FetchUserCredentialState extends Equatable {
  const FetchUserCredentialState();

  @override
  List<Object> get props => [];
}

final class FetchUserCredentialInitial extends FetchUserCredentialState {}

class UserCredentialFetchedIsPresent extends FetchUserCredentialState {}

class UserCredentialFetchedIsAbsent extends FetchUserCredentialState {}
