import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/current_host/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/current_host/data/repositories/current_host_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';

part 'current_host_state.dart';

@LazySingleton()
class CurrentHostCubit extends Cubit<CurrentHostState> {
  CurrentHostCubit(
    this._repository,
  ) : super(CurrentHostInitial());

  final CurrentHostRepository _repository;

  Future<void> getData() async {
    emit(CurrentHostLoading());
    try {
      final hostInfo = await _repository.getData();

      emit(CurrentHostSuccess(hostInfo));
    } on DartSiaException catch (e) {
      emit(CurrentHostFailure(e));
    }
  }
}
