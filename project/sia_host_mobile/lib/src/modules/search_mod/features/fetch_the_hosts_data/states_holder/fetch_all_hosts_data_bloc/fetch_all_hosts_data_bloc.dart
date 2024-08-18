import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/entities/card_of_host_entity.dart';
import '../../domain/usecases/fetch_all_the_host_usecase.dart';
import '../../domain/usecases/search_the_host_by_pub_key_usecase.dart';

part 'fetch_all_hosts_data_event.dart';
part 'fetch_all_hosts_data_state.dart';

@injectable
class FetchAllHostsDataBloc
    extends Bloc<FetchAllHostsDataEvent, FetchAllHostsDataState> {
  final FetchAllTheHostUsecase fetchAllTheHostUsecase;
  final SearchTheHostByPubKeyUsecase searchTheHostByPubKeyUsecase;

  FetchAllHostsDataBloc({
    required this.searchTheHostByPubKeyUsecase,
    required this.fetchAllTheHostUsecase,
  }) : super(FetchAllHostsDataInitial()) {
    on<FetchAllHostsDataListEvent>((event, emit) async {
      emit(HostDataListLoading());
      Result<List<CardOfHostEntity>, String> _result =
          await fetchAllTheHostUsecase.call();
      _result.when(
          (success) => emit(HostDataListLoaded(hostModelList: success)),
          (error) => emit(HostDataListError(message: error)));
    });

    on<SearchHostSearchedByPubKeyEvent>((event, emit) async {
      emit(HostDataListLoading());
      Result<List<CardOfHostEntity>, String> _result =
          await searchTheHostByPubKeyUsecase.call(pubKey: event.pubKey);
      _result.when(
          (success) => emit(HostDataListLoaded(hostModelList: success)),
          (error) => emit(HostDataSearchedListEmpty(message: error)));
    });
  }
}
