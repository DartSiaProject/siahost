import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/host_list/data/repositories/location_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';

part 'host_location_state.dart';

// @LazySingleton()
class HostLocationCubit extends Cubit<HostLocationState> {
  HostLocationCubit(this._locationRepository) : super(HostLocationInitial());

  final LocationRepository _locationRepository;

  /// Get the location address of a host
  ///
  Future<void> getLocationAddress(String networkAddress) async {
    emit(HostLocationLoading());
    try {
      final location = await _locationRepository.getLocationAddress(
        networkAddress,
      );
      emit(HostLocationSuccess(location));
    } catch (e) {
      emit(HostLocationFailure(DartSiaException.handleError(e)));
    }
  }
}
