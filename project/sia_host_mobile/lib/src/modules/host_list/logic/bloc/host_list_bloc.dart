import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/host_list/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/host_list/data/repositories/host_list_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

part 'host_list_event.dart';
part 'host_list_state.dart';

@LazySingleton()
class HostListBloc extends Bloc<HostListEvent, HostListState> {
  HostListBloc(this._repository) : super(const HostListState()) {
    on<HostListFetchedEvent>(_onHostsFetched);
    on<HostListSearchedEvent>(_onHostsSearched);
  }

  final HostListRepository _repository;

  /// on Hosts Fetching
  ///
  FutureOr<void> _onHostsFetched(
    HostListFetchedEvent event,
    Emitter<HostListState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));

    try {
      final hosts = await _repository.getHostList();
      emit(state.copyWith(status: StateStatus.success, hosts: hosts));
    } on DartSiaException catch (e) {
      emit(state.copyWith(status: StateStatus.failure, error: e));
    }
  }

  /// On host searching
  ///
  FutureOr<void> _onHostsSearched(
    HostListSearchedEvent event,
    Emitter<HostListState> emit,
  ) async {
    if (event.publicKey.isEmpty) {
      emit(state.copyWith(status: StateStatus.loading));
      await Future<dynamic>.delayed(const Duration(seconds: 1));

      emit(state.copyWith(status: StateStatus.success, hosts: state.hosts));
      return;
    }

    emit(state.copyWith(status: StateStatus.searching));
    await Future<dynamic>.delayed(const Duration(seconds: 1));

    final hostIndex =
        state.hosts.indexWhere((e) => e.publicKey == event.publicKey);

    if (hostIndex != -1) {
      emit(
        state.copyWith(
          status: StateStatus.success,
          searchedHost: state.hosts[hostIndex],
        ),
      );
      return;
    }

    emit(state.copyWith(status: StateStatus.searchingFailure));
    return;
  }
}
