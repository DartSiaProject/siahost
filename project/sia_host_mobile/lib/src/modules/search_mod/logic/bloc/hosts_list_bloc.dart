import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/search_mod/data/models/host_info.dart';

part 'hosts_list_event.dart';
part 'hosts_list_state.dart';

class HostsListBloc extends Bloc<HostsListEvent, HostsListState> {
  HostsListBloc() : super(HostsListInitial()) {
    on<HostsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
