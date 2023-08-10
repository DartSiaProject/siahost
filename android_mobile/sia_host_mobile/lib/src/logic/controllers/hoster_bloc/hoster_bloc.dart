import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/logic/models/host_setting.dart';
import 'package:sia_host_mobile/src/logic/usecases/host_usecases/get_some_host_from_renterd_usecase.dart';
import 'package:sia_host_mobile/src/logic/usecases/host_usecases/update_some_host_from_renterd_usecase.dart';

part 'hoster_event.dart';
part 'hoster_state.dart';

class HosterBloc extends Bloc<HosterEvent, HosterState> {
  final GetSomeHostFromRenterdUsecase getSomeHostFromRenterdUsecase;
  final UpdateSomeHostFromRenterdUsecase updateSomeHostFromRenterdUsecase;

  HosterBloc({
    required this.getSomeHostFromRenterdUsecase,
    required this.updateSomeHostFromRenterdUsecase,
  }) : super(HosterInitial()) {
    on<GetMyHostFromRenterdEvent>((event, emit) async {
      emit(MyHostLoading());
      Result<HostSetting, String> _result =
          await getSomeHostFromRenterdUsecase.call();

      _result.when(
          (success) => emit(MyHostDataGetSuccess(hostSetting: success)),
          (error) => emit(MyHostDataGetFailed(message: error)));
    });

    on<UpdateMyHostFromRenterdEvent>((event, emit) async {
      emit(MyHostConfigLoading());
      Result<String, String> _result = await updateSomeHostFromRenterdUsecase
          .call(hostSetting: event.hostSetting);

      _result.when((success) => emit(MyHostConfigSuccess(message: success)),
          (error) => emit(MyHostConfigFailed(message: error)));
    });
  }
}
