import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/host_config/data/models/dto/host_config_dto.dart';
import 'package:sia_host_mobile/src/modules/host_config/data/repositories/host_config_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';

part 'host_config_state.dart';

class HostConfigCubit extends Cubit<HostConfigState> {
  HostConfigCubit(this._repository) : super(HostConfigInitial());

  final HostConfigRepository _repository;

  Future<void> updateHost(HostConfigDto dto) async {
    emit(HostConfigLoading());

    try {
      await _repository.updateHost(dto);

      emit(HostConfigSuccess());
    } on DartSiaException catch (e) {
      emit(HostConfigFailure(e));
    }
  }
}
