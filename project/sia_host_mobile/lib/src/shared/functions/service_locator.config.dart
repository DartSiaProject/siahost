// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/routes/app_router.dart' as _i798;
import '../../modules/app/logic/cubit/onboarding_cubit.dart' as _i725;
import '../../modules/auth/data/repositories/auth_repository.dart' as _i135;
import '../../modules/auth/logic/cubit/auth_cubit.dart' as _i653;
import '../services/api_client.dart' as _i933;
import '../services/storage_service.dart' as _i306;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i933.ApiClient>(() => _i933.ApiClient()..init());
    gh.singleton<_i306.StorageService>(() => _i306.StorageService()..init());
    gh.lazySingleton<_i798.AppRouter>(() => _i798.AppRouter());
    gh.lazySingleton<_i725.OnboardingCubit>(
        () => _i725.OnboardingCubit(gh<_i306.StorageService>()));
    gh.lazySingleton<_i135.AuthRepository>(() => _i135.AuthRepository(
          gh<_i933.ApiClient>(),
          gh<_i306.StorageService>(),
        ));
    gh.lazySingleton<_i653.AuthCubit>(
        () => _i653.AuthCubit(gh<_i135.AuthRepository>()));
    return this;
  }
}
