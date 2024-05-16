import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/entities/the_new_data_host_entity.dart';
import '../../domain/usecases/reconfig_the_host_usecase.dart';

part 'reconfig_the_host_data_event.dart';
part 'reconfig_the_host_data_state.dart';

@injectable
class ReconfigTheHostDataBloc
    extends Bloc<ReconfigTheHostDataEvent, ReconfigTheHostDataState> {
  final ReconfigTheHostUsecase reconfigTheHostUsecase;

  ReconfigTheHostDataBloc({required this.reconfigTheHostUsecase})
      : super(ReconfigTheHostDataInitial()) {
    on<UpdateTheHostFromRenterdEvent>((event, emit) async {
      emit(TheHostConfigLoading());
      Result<String, String> _result = await reconfigTheHostUsecase.call(
          theNewDataHostEntity: event.theNewDataHostEntity);

      _result.when((success) => emit(TheHostConfigSuccess(message: success)),
          (error) => emit(TheHostConfigFailed(message: error)));
    });
  }
}
