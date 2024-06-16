import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/entities/host_info_entity.dart';
import '../../domain/usecases/fetch_one_host_info_data_usecase.dart';

part 'fetch_one_host_data_and_show_it_event.dart';
part 'fetch_one_host_data_and_show_it_state.dart';

@injectable
class FetchOneHostDataAndShowItBloc extends Bloc<FetchOneHostDataAndShowItEvent,
    FetchOneHostDataAndShowItState> {
  final FetchOneHostInfoDataUsecase fetchOneHostInfoDataUsecase;

  FetchOneHostDataAndShowItBloc({
    required this.fetchOneHostInfoDataUsecase,
  }) : super(FetchOneHostDataAndShowItInitial()) {
    on<FetchOneHostDataEvent>((event, emit) async {
      Result<HostInfoEntity, String> _result =
          await fetchOneHostInfoDataUsecase.call(pubKey: event.pubKey);

      _result.when(
          (success) => emit(HostDataFetchedSuccess(hostInfoEntity: success)),
          (error) => emit(HostDataFetchedFailed(message: error)));
    });
  }
}
