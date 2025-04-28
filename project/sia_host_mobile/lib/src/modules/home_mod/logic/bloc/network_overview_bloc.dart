import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/home_mod/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/home_mod/data/repositories/repositories.dart';

part 'network_overview_event.dart';
part 'network_overview_state.dart';

@Injectable()
class NetworkOverviewBloc
    extends Bloc<NetworkOverviewEvent, NetworkOverviewState> {
  NetworkOverviewBloc({
    required NetworkOverviewRepository repository,
  })  : _repository = repository,
        super(NetworkOverviewInitial()) {
    on<NetworkOverviewFetchedEvent>(_onFetchNetworkData);
  }

  final NetworkOverviewRepository _repository;

  FutureOr<void> _onFetchNetworkData(
    NetworkOverviewFetchedEvent event,
    Emitter<NetworkOverviewState> emit,
  ) async {
    emit(NetworkOverviewLoading());

    final result = await _repository.getData();

    result.when(
      (data) => emit(NetworkOverviewSuccess(networkData: data)),
      (error) => emit(NetworkOverviewFailure(error: error)),
    );
  }
}
