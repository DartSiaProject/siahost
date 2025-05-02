import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:renterd/renterd.dart';
import 'package:sia_host_mobile/src/shared/services/storage_service.dart';

part 'onboarding_state.dart';

@LazySingleton()
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._storage) : super(OnboardingInitial());

  final StorageService _storage;

  Future<void> getStarted() async {
    emit(OnboardingLoading());

    await _storage.setOnboarding();

    await Future<dynamic>.delayed(const Duration(seconds: 1));

    emit(OnboardingSuccess());
  }
}
