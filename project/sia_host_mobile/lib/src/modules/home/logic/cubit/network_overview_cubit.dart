import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/home/data/models/network_data.dart';
import 'package:sia_host_mobile/src/modules/home/data/repositories/network_overview_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';

part 'network_overview_state.dart';

@LazySingleton()
class NetworkOverviewCubit extends Cubit<NetworkOverviewState> {
  NetworkOverviewCubit(this._repository) : super(NetworkOverviewInitial());

  final NetworkOverviewRepository _repository;

  /// Get the network overview
  ///
  Future<void> getData() async {
    emit(NetworkOverviewLoading());

    // final mapp = <Map<String, dynamic>>[
    //   {
    //     'value': 'First',
    //     'checks': null,
    //     'settings': 1,
    //     'other': {'also': 'value'},
    //   },
    //   {
    //     'value': 'Second',
    //     'checks': {
    //       'autopilot': null,
    //     },
    //     'settings': 1,
    //     'other': {'also': 'value'},
    //   },
    //   {
    //     'value': 'Third',
    //     'settings': 1,
    //     'other': {'also': 'value'},
    //   },
    // ];

    // try {
    //   final activeHosts = mapp.where((h) {
    //     // h['checks']['autopilot']['usability']['gouging'] == true
    //     if ((h as Map).containsKey('checks') &&
    //         ((h['checks'] as Map?)?.containsKey('autopilot') ?? false) &&
    //         ((h['checks']['autopilot'] as Map?)?.containsKey('score') ??
    //             false)) {
    //       return true;
    //     }

    //     try {
    //       final score = h['checks']['autopilot']['usability']['gouging'];
    //       return score != null;
    //     } catch (e) {
    //       Logger().f(e);
    //       return false;
    //     }
    //     // return false;
    //     //   &&
    //     // (h['checks']['autopilot'] as Map).containsKey('score')
    //     // return true;
    //     //   },
    //     //   return false;
    //   }).toList();
    //   Logger().w(activeHosts);
    // } catch (e) {
    //   Logger().f(e);
    // }
    try {
      final networkData = await _repository.getData();
      emit(NetworkOverviewSuccess(networkData: networkData));
    } on DartSiaException catch (e) {
      emit(NetworkOverviewFailure(error: e));
    }
  }
}
