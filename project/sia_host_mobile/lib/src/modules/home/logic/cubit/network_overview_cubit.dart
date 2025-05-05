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

    try {
      final networkData = await _repository.getData();
      emit(NetworkOverviewSuccess(networkData: networkData));
    } on DartSiaException catch (e) {
      emit(NetworkOverviewFailure(error: e));
    }
  }
}
