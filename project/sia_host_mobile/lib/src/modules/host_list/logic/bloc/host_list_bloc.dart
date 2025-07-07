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
    // emit(state.copyWith(status: StateStatus.loading));

    // try {
    //   final hosts = await _repository.getHostList();
    //   emit(state.copyWith(status: StateStatus.success, hosts: hosts));
    // } on DartSiaException catch (e) {
    //   emit(state.copyWith(status: StateStatus.failure, error: e));
    // }

    if ((event.reset == false && state.hasMore == false) ||
        state.status == StateStatus.loading ||
        state.status == StateStatus.paginating) {
      return;
    }

    emit(
      state.copyWith(
        status: event.reset ? StateStatus.loading : StateStatus.paginating,
      ),
    );

    try {
      final result = await _repository.getHostList(
        page: event.reset ? 0 : state.page,
      );

      final hasMore = result.$2;
      emit(
        state.copyWith(
          status: StateStatus.success,
          hosts: event.reset ? result.$1 : [...state.hosts, ...result.$1],
          hasMore: hasMore,
          page: hasMore ? state.page + 1 : state.page,
        ),
      );
    } on DartSiaException catch (e) {
      emit(
        state.copyWith(
          status:
              event.reset ? StateStatus.failure : StateStatus.paginatingFailure,
          error: e,
        ),
      );
    }
  }

  /// On host searching
  ///
  FutureOr<void> _onHostsSearched(
    HostListSearchedEvent event,
    Emitter<HostListState> emit,
  ) async {
    // if (event.publicKey.isEmpty) {
    //   emit(state.copyWith(status: StateStatus.loading));
    //   await Future<dynamic>.delayed(const Duration(seconds: 1));

    //   emit(state.copyWith(status: StateStatus.success, hosts: state.hosts));
    //   return;
    // }

    // emit(state.copyWith(status: StateStatus.searching));
    // await Future<dynamic>.delayed(const Duration(seconds: 1));

    // final hostIndex =
    //     state.hosts.indexWhere((e) => e.publicKey == event.publicKey);

    // if (hostIndex != -1) {
    //   emit(
    //     state.copyWith(
    //       status: StateStatus.success,
    //       searchedHost: state.hosts[hostIndex],
    //     ),
    //   );
    //   return;
    // }

    // emit(state.copyWith(status: StateStatus.searchingFailure));
    // return;

    if (event.publicKey.isEmpty) {
      emit(state.copyWith(status: StateStatus.loading));
      await Future<dynamic>.delayed(const Duration(seconds: 1));

      emit(state.copyWith(status: StateStatus.success, hosts: state.hosts));
      return;
    }

    emit(state.copyWith(status: StateStatus.searching));

    try {
      // try finding locally
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

      // go to the server if not
      final host = await _repository.getHost(publicKey: event.publicKey);
      if (host != null) {
        emit(
          state.copyWith(
            status: StateStatus.success,
            searchedHost: state.hosts[hostIndex],
          ),
        );
        return;
      }
      emit(state.copyWith(status: StateStatus.searchingFailure));
    } catch (e) {
      emit(state.copyWith(status: StateStatus.searchingFailure));
    }
  }
}
