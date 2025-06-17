part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  AuthFailure({required this.error});

  final DartSiaException error;

  @override
  List<Object> get props => [error];
}
