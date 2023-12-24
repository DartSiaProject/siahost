import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../usecases/network_overview_usecases/get_network_data_usecase.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final GetNetworkDataUsecase getNetworkDataUsecase;
  NetworkBloc({
    required this.getNetworkDataUsecase,
  }) : super(NetworkInitial()) {
    on<GetNetworkDataEvent>((event, emit) async {
      emit(HostLoading());
      var _result = await getNetworkDataUsecase.call();
      _result.when(
        (success) => emit(NetworkDataGetSuccess(networkData: success)),
        (error) => emit(NetworkDataGetFailed(message: error)),
      );
    });
  }
}
