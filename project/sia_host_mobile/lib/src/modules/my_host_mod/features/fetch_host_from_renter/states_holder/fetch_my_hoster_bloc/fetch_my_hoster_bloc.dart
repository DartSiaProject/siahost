import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../domain/entities/my_host_data_entity.dart';
import '../../domain/usecases/fetch_my_host_from_renter_usecase.dart';

part 'fetch_my_hoster_event.dart';
part 'fetch_my_hoster_state.dart';

@injectable
class FetchMyHosterBloc extends Bloc<FetchMyHosterEvent, FetchMyHosterState> {
  final FetchMyHostFromRenterUsecase fetchMyHostFromRenterUsecase;

  FetchMyHosterBloc({required this.fetchMyHostFromRenterUsecase})
      : super(FetchMyHosterInitial()) {
    on<FetchMyHostFromRenterdEvent>((event, emit) async {
      emit(MyHostDataGetLoading());
      Result<MyHostDataEntity, String> _result =
          await fetchMyHostFromRenterUsecase.call();

      _result.when(
          (success) => emit(MyHostDataGetSuccess(myHostDataEntity: success)),
          (error) => emit(error == Lang.makeLoginDemandText
              ? MakLoginPlease(message: error)
              : MyHostDataGetFailed(message: error)));
    });
  }
}
