import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/host.dart';
import '../../usecases/network_overview_usecases/get_all_hosts_usecase.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final GetAllHostsUsecase getAllHostsUsecase;
  NetworkBloc({
    required this.getAllHostsUsecase,
  }) : super(NetworkInitial()) {
    on<GetAllHostsEvent>((event, emit) async {
      emit(HostLoading());
      Result<List<Host>, String> _result = await getAllHostsUsecase.call();
      _result.when(
        (success) => emit(AllHostsGetSuccess(hostListLength: success.length)),
        (error) => emit(AllHostsGetFailed(message: error)),
      );
    });
  }
}
