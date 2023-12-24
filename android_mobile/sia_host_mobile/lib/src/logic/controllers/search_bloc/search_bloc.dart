import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/host.dart';
import '../../usecases/host_usecases/get_host_list_usecase.dart';
import '../../usecases/host_usecases/get_host_searched_by_pub_key_usecase.dart';
import '../../usecases/host_usecases/get_one_host_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetHostDataListUsecase getHostDataListUsecase;
  final GetHostSearchedByPubKeyUsecase getHostSearchedByPubKeyUsecase;
  final GetOneHostUsecase getOneHostUsecase;

  SearchBloc({
    required this.getHostDataListUsecase,
    required this.getHostSearchedByPubKeyUsecase,
    required this.getOneHostUsecase,
  }) : super(SearchInitial()) {
    on<GetAllHostsDataListEvent>((event, emit) async {
      emit(HostDataListLoading());
      Result<List<Host>, String> _result = await getHostDataListUsecase.call();
      _result.when(
          (success) => emit(HostDataListLoaded(hostModelList: success)),
          (error) => emit(HostDataListError(message: error)));
    });

    on<GetHostSearchedByPubKeyEvent>((event, emit) async {
      emit(HostDataListLoading());
      Result<List<Host>, String> _result =
          await getHostSearchedByPubKeyUsecase.call(
        pubKey: event.pubKey,
      );
      _result.when(
          (success) => emit(HostDataListLoaded(hostModelList: success)),
          (error) => emit(HostDataSearchedListEmpty(message: error)));
    });

    on<NextSubPageIndexEvent>((event, emit) {
      emit(NextSubFragmentSelected(
        nextSubFragmentIndex: event.index,
        hostPubKey: event.hostPubKey,
      ));
    });

    on<PreviousSubPageIndexEvent>((event, emit) {
      emit(PreviousSubFragmentSelected(previousSubFragmentIndex: event.index));
    });

    on<GetOneHostEvent>((event, emit) async {
      emit(HostInfoGetLoading());
      Host _result = await getOneHostUsecase.call(pubKey: event.pubKey);
      emit(HostInfoGot(hostModel: _result));
    });
  }
}
