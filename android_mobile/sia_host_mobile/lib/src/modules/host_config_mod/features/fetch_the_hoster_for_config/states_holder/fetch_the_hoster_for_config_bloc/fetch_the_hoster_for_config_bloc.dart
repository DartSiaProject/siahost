import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart';

import '../../domain/entities/the_host_data_entity.dart';
import '../../domain/usecases/fetch_the_hoster_for_config_usecase.dart';

part 'fetch_the_hoster_for_config_event.dart';
part 'fetch_the_hoster_for_config_state.dart';

@injectable
class FetchTheHosterForConfigBloc
    extends Bloc<FetchTheHosterForConfigEvent, FetchTheHosterForConfigState> {
  final FetchTheHosterForConfigUsecase fetchTheHosterForConfigUsecase;

  FetchTheHosterForConfigBloc({required this.fetchTheHosterForConfigUsecase})
      : super(FetchTheHosterForConfigInitial()) {
    on<FetchTheHostFromRenterdForConfigEvent>((event, emit) async {
      Result<TheHostDataEntity, String> _result =
          await fetchTheHosterForConfigUsecase.call();

      _result.when(
          (success) => emit(
              TheHostDataFetchedForConfigSuccess(theHostDataEntity: success)),
          (error) => emit(error == Lang.makeLoginDemandText
              ? MakLoginForConfigPlease(message: error)
              : TheHostDataFetchedForConfigFailed(message: error)));
    });
  }
}
