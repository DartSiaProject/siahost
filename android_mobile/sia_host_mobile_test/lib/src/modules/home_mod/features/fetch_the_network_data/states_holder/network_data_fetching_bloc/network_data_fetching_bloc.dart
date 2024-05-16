import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/network_data_entity.dart';
import '../../domain/usecases/user_fetch_the_network_data_usecase.dart';

part 'network_data_fetching_event.dart';
part 'network_data_fetching_state.dart';

@injectable
class NetworkDataFetchingBloc
    extends Bloc<NetworkDataFetchingEvent, NetworkDataFetchingState> {
  final UserFetchTheNetworkDataUsecase userFetchTheNetworkDataUsecase;

  NetworkDataFetchingBloc({required this.userFetchTheNetworkDataUsecase})
      : super(NetworkDataFetchingInitial()) {
    on<FetchNetworkDataEvent>((event, emit) async {
      var _result = await userFetchTheNetworkDataUsecase.call();
      _result.when(
        (success) =>
            emit(NetworkDataFetchedSuccess(networkDataEntity: success)),
        (error) => emit(NetworkDataFetchedFailed(message: error)),
      );
    });
  }
}
