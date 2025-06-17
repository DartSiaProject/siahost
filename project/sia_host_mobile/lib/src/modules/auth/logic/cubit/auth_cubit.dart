import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/auth/data/models/dto/login_dto.dart';
import 'package:sia_host_mobile/src/modules/auth/data/repositories/auth_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';

part 'auth_state.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repository) : super(AuthInitial());

  final AuthRepository _repository;

  /// Log the user in the application
  ///
  Future<void> login(LoginDto login) async {
    emit(AuthLoading());

    try {
      await _repository.login(login);

      emit(AuthSuccess());
    } on DartSiaException catch (e) {
      emit(AuthFailure(error: e));
    }
  }
}
